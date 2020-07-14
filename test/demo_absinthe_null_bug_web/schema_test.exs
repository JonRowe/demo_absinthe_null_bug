defmodule DemoAbsintheNullBugWeb.SchemaTest do
  use DemoAbsintheNullBugWeb.ConnCase, async: true

  setup do
    request =
      build_conn()
      |> put_req_header("content-type", "application/json")

    {:ok, request: request}
  end

  test "missing null field causes a null list", %{request: request} do
    query =
      """
      query {
        results {
          id
        }
      }
      """

    response = post(request, "/graphql", %{query: query, variables: %{}})
    assert response.status == 200
    assert %{"data" => %{"results" => []}} = Jason.decode!(response.resp_body)
  end

  test "missing null field on child causes a null list", %{request: request} do
    query =
      """
      query {
        results {
          nested {
            id
          }
        }
      }
      """

    response = post(request, "/graphql", %{query: query, variables: %{}})
    assert response.status == 200
    assert %{"data" => %{"results" => []}} = Jason.decode!(response.resp_body)
  end

  test "missing null field on child of child causes null list", %{request: request} do
    query =
      """
      query {
        results {
          nested {
            items {
              id
            }
          }
        }
      }
      """
    response = post(request, "/graphql", %{query: query, variables: %{}})
    assert response.status == 200
    assert %{"data" => %{"results" => [%{"nested" => %{"items" => []}}]}} = Jason.decode!(response.resp_body)
  end
end
