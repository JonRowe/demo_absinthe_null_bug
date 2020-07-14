defmodule DemoAbsintheNullBug.Schema do
  @moduledoc """
  Defines the schema in GraphQL using Absinthe.
  """
  use Absinthe.Schema

  alias DemoAbsintheNullBug.{Items, Nested, Results}

  @desc "An item"
  object :item do
    field(:id, non_null(:string))
  end

  @desc "Something nested"
  object :nested do
    field(:id, non_null(:string))
    field(:items, non_null(list_of(non_null(:item))), resolve: &Items.fetch/3)
  end

  @desc "A Result"
  object :result do
    field(:id, non_null(:string))

    @desc "This should never be null"
    field(:nested, non_null(:nested), resolve: &Nested.fetch/3)
  end

  @desc """
    Queries exist for returning data.
  """
  query do
    @desc "Returns results for something."
    field(:results, non_null(list_of(non_null(:result))), resolve: &Results.list/2)
  end
end
