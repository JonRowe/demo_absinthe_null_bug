defmodule DemoAbsintheNullBug.Nested do
  def fetch(_, _, _) do
    {:ok, %{}}
  end
end
