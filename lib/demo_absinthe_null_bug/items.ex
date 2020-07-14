defmodule DemoAbsintheNullBug.Items do
  def fetch(_, _, _) do
    {:ok, [%{}]}
  end
end
