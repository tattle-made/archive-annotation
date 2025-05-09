defmodule Kosh.XML.EADSaxyHandler do
  @behaviour Saxy.Handler

  defstruct [:eadheader, :archdesc]

  def handle_event(:start_document, data, _state) do
    IO.inspect("start doc")

    {:ok, %__MODULE__{}}
  end

  def handle_event(:end_document, data, state) do
    IO.inspect("end doc")
    IO.inspect(state)
    {:ok, state}
  end

  def handle_event(:start_element, {current_tag, _attributes}, {parent_tag, state}) do
    IO.inspect("elemente started")
    IO.inspect(current_tag)
    IO.inspect(parent_tag)
    # IO.inspect(state)
    IO.inspect("element ended")

    # new_parent_tag =
    # case state do
    #   %{} -> parent_tag

    #   _ ->

    #     last_tag = tl(parent_tag)
    #     case last_tag == current_tag do
    #       true -> parent_tag
    #       false -> parent_tag ++ current_tag
    #     end
    # end




    new_state = Map.put(state, parent_tag, %{})
    # put_in()

    {:ok, {current_tag, new_state}}
  end

  def handle_event(:characters, content, {current_tag, state}) do
    # IO.inspect("characters -#{content}")
    IO.inspect("character started current_tag")
    IO.inspect(current_tag)
    IO.inspect(content)
    # IO.inspect("state -")
    # IO.inspect(state)
    {:ok, {current_tag, state}}
  end

  def handle_event(:end_element, _data, ead) do
    {:ok, ead}
  end
end
