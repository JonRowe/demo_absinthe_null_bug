defmodule DemoAbsintheNullBug.Results do
  def list(_, _) do
    {:ok, [%{}]}
  end
end
