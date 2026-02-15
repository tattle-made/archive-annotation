defmodule Kosh.Repo.Migrations.AddEmotionsAnnotationTrigger do
  use Ecto.Migration

  @moduledoc """
  This migration created a function that is used in the trigger while insert or update
  in the emotions_annotation table.

  The function makes sure that the "no_response" emotion_annotation does not exist with any
  other emotion_annotation(s), and vice-versa.

  If the annotation is "no_response" for emotion, the function deletes all the other
  annotations for that file and user.

  If the annotation is for any other emotion, and there is already a "no_response" annotation
  present, the function first deletes the existing "no_response" annotation, and then adds the new
  emotion_annotation.

  """

  def up do
    execute("""
    CREATE OR REPLACE FUNCTION handle_no_response_annotation()
    RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    DECLARE
    de_name text;
    BEGIN
    -- lock per (user_id, file_id) to avoid race conditions
    PERFORM pg_advisory_xact_lock(hashtext(NEW.user_id::text || ':' || NEW.file_id::text));

    -- get emotion name of the row being inserted/updated
    SELECT lower(name)
    INTO de_name
    FROM defined_emotions
    WHERE id = NEW.defined_emotion_id;

    -- safety check
    IF de_name IS NULL THEN
    RAISE EXCEPTION 'defined_emotion % not found', NEW.defined_emotion_id;
    END IF;

    -- if inserting "no_response"
    IF de_name = 'no_response' THEN
    DELETE FROM emotion_annotations
    WHERE user_id = NEW.user_id
      AND file_id = NEW.file_id
      AND defined_emotion_id <> NEW.defined_emotion_id;

    RETURN NEW;

    -- if inserting any normal emotion
    ELSE
    DELETE FROM emotion_annotations ea
    USING defined_emotions de
    WHERE ea.user_id = NEW.user_id
      AND ea.file_id = NEW.file_id
      AND ea.defined_emotion_id = de.id
      AND lower(de.name) = 'no_response';

    RETURN NEW;
    END IF;
    END;
    $$;

    """)

    execute("DROP TRIGGER IF EXISTS trg_handle_no_response ON emotion_annotations;")

    execute("""
    CREATE TRIGGER trg_handle_no_response
    BEFORE INSERT OR UPDATE OF defined_emotion_id
    ON emotion_annotations
    FOR EACH ROW
    EXECUTE FUNCTION handle_no_response_annotation();
    """)
  end

  def down do
    execute("DROP TRIGGER IF EXISTS trg_handle_no_response ON emotion_annotations;")
    execute("DROP FUNCTION IF EXISTS handle_no_response_annotation();")
  end
end
