defmodule KoshWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use KoshWeb, :controller` and
  `use KoshWeb, :live_view`.
  """
  use KoshWeb, :html

  embed_templates "layouts/*"
end
