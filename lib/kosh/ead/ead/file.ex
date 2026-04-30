defmodule Kosh.EAD.File do
  use Ecto.Schema
  import Ecto.Changeset

  # Fields to Display: Title (of file), Subject(s), Description, Collection, Series, Sub-Series, Date(s), Identifier, Key Object Links
  # unitid, unittitle, unitdate, scopecontent,controlaccess, dao (which has xlink:actuate with an xlink:href that points to a digital object)
  schema "files" do
    field :title, :string
    field :description, {:array, :string}, default: []
    field :uri, :string
    field :archival_space, :string


    # all possible fields: address, arrangement, blockquote, chronlist, dao, daogrp, head, list, note, p, scopecontent, table
    # field :scopecontent, :map,
    #   default: %{
    #     head: "",
    #     p: ""
    #   }

    # On replace: delete would replace the entire existing value with the new one. On replace: update would try to find the difference between old and new values and update the existing value.
    # In case of updating the fields like dao and unitdate, everything works as expected with :update on doing Repo.update(changeset), expect for the case when the object is not present (or deleted)
    # in the new attributes. The on_replace: :update doesn't make any changes to the existing value. Therefore, using on_replace: :delete makes more sense, as it completely replaces the old value with new, so i fthere is
    # empty object or nil, it just resets the value.
    embeds_one :unitdate, Kosh.EAD.UnitDate, on_replace: :delete
    embeds_one :unitid, Kosh.EAD.UnitId, on_replace: :update
    embeds_one :dao, Kosh.EAD.Dao, on_replace: :delete

    belongs_to :collection, Kosh.EAD.Collection
    belongs_to :series, Kosh.EAD.Series
    belongs_to :sub_series, Kosh.EAD.SubSeries

    many_to_many :subjects, Kosh.EAD.Subject,
      join_through: Kosh.EAD.FilesSubject,
      on_delete: :nothing,
      on_replace: :delete

    has_many :description_annotations, Kosh.Annotations.DescriptionAnnotation
    has_many :subjects_annotations, Kosh.Annotations.SubjectsAnnotation

    has_many :accepted_description_annotations,
             Kosh.Annotations.DescriptionAnnotation,
             where: [status: :accepted],
             foreign_key: :file_id

    has_many :accepted_subjects_annotations,
             Kosh.Annotations.SubjectsAnnotation,
             where: [status: :accepted],
             foreign_key: :file_id

    has_many :accepted_agent_annotations,
             Kosh.Annotations.AgentAnnotation,
             where: [status: :accepted],
             foreign_key: :file_id

    has_many :emotion_annotations, Kosh.Annotations.EmotionAnnotation, foreign_key: :file_id

    # many_to_many :annotated_subjects, Kosh.EAD.Subject,
    #   join_through: "files_subjects",
    #   on_delete: :nothing,
    #   on_replace: :delete,
    #   where: [origin: "annotation"]

    timestamps()
  end

  @doc false
  def changeset(file, attrs) do
    file
    |> cast(attrs, [
      :title,
      :description,
      :collection_id,
      :series_id,
      :sub_series_id,
      :uri,
      :archival_space
    ])
    |> cast_embed(:unitdate)
    |> cast_embed(:unitid)
    |> cast_embed(:dao)
    |> cast_assoc(:subjects, with: &Kosh.EAD.Subject.changeset/2)
    |> validate_required([:title, :collection_id, :uri, :archival_space])
    |> unique_constraint([:archival_space, :uri])
    |> then(fn cs ->
      Ecto.Changeset.validate_change(cs, :sub_series_id, fn :sub_series_id, ss_id ->
        if ss_id && is_nil(get_field(cs, :series_id)) do
          [sub_series_id: "must have a series_id if you include a sub_series_id"]
        else
          []
        end
      end)
    end)
  end
end
