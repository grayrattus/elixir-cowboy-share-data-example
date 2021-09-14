defmodule ElixirRegistryExample.RestHeaders do
  def init(req, state) do
    Registry.register(Registry.ElixirRegistryExample, "hello", {1, :atom, 1})
    Registry.register(Registry.ElixirRegistryExample, "hello", {2, :atom, 2})
    Registry.register(Registry.ElixirRegistryExample, "hello", {2, :atom, 2})
    Registry.register(Registry.ElixirRegistryExample, "hello", {2, :atom, 2})
    handle(req, state)
  end

  def handle(request, state) do
    Registry.register(Registry.ElixirRegistryExample, "hello", {1, :atom, 1})
    Registry.register(Registry.ElixirRegistryExample, "hello", {2, :atom, 2})
    Registry.register(Registry.ElixirRegistryExample, "hello", {2, :atom, 2})
    Registry.register(Registry.ElixirRegistryExample, "hello", {2, :atom, 2})
    Registry.register(Registry.ElixirRegistryExample, "hello", {2, :atom, 2})

    # IO.inspect(Registry.count_match(Registry.ElixirRegistryExample, "hello", {2, :_, :_}))
    # IO.inspect(Registry.keys(Registry.ElixirRegistryExample, self()))
    GenServer.cast(Stack, {:push, :world})
    GenServer.cast(Stack, {:push, :world})
    GenServer.cast(Stack, {:push, :world})
    GenServer.cast(Stack, {:push, :world})
    GenServer.cast(Stack, {:push, :world})
    IO.inspect(GenServer.call(Stack, :get))

    req =
      :cowboy_req.reply(
        200,
        %{},
        [to_string(Registry.count_match(Registry.ElixirRegistryExample, "hello", {2, :_, :_}))],
        request
      )

    {:ok, req, state}
  end
end
