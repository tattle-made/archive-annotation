defmodule Kosh.Repo.Migrations.CreateAnnotationStatusEnum do
  use Ecto.Migration

  def change do
    execute "CREATE TYPE annotation_status AS ENUM ('pending', 'accepted', 'rejected')",
           "DROP TYPE annotation_status"
  end
end
