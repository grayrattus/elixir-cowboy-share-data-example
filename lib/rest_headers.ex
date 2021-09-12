defmodule ElixirRegistryExample.RestHeaders do
  def init(req, state) do
    handle(req, state)
  end

  def handle(request, state) do
    req = :cowboy_req.reply(200, %{}, ["Hello world!"], request)
    {:ok, req, state}
  end
end
