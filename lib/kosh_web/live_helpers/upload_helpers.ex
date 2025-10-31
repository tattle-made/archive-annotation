# lib/kosh_web/live_helpers/upload_helpers.ex
defmodule KoshWeb.UploadHelpers do
  # Ensure uploads directory exists
  def ensure_uploads_dir do
    uploads_dir = Path.join([:code.priv_dir(:kosh), "static", "uploads"])
    unless File.dir?(uploads_dir), do: File.mkdir_p!(uploads_dir)
  end
end
