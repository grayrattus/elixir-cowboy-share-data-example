defmodule ElixirRegistryExample do
  use Application

  @moduledoc """
  Documentation for ElixirRegistryExample.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirRegistryExample.hello()
      :world

  """

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: ElixirRegistryExample.Router,
        options: [
          dispatch: dispatch(),
          port: 4000
        ]
      ),
      Registry.child_spec(
        keys: :duplicate,
        name: Registry.ElixirRegistryExample
      ),
      %{
        id: Stack,
        start: {Stack, :start_link, [[:hello]]}
      }
    ]

    opts = [strategy: :one_for_one, name: ElixirRegistryExample.Application]
    Supervisor.start_link(children, opts)
  end

  defp dispatch do
    [
      {:_,
       [
         {"/restHandler", ElixirRegistryExample.RestHandler, []},
         {"/restHeaders", ElixirRegistryExample.RestHeaders, []}
       ]}
    ]
  end
end
