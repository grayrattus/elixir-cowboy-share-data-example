defmodule ElixirRegistryExample.RestHandler do
  def init(req, state) do
    handle(req, state)
  end

  def handle(request, state) do
    IO.puts("Hello world")

    req =
      :cowboy_req.reply(
        200,
        # [{"content-type", "text/html"}],
        "fsdfasd fasd fsd a",
        request
      )

    {:ok, req, state}
  end

  def terminate(_reason, _request, _state) do
    # IO.puts("Terminating for reason: #{inspect(reason)}")
    # IO.puts("Terminating after request: #{inspect(request)}")
    # IO.puts("Terminating with state: #{inspect(state)}")
    :ok
  end

  def build_body(request) do
    """
        <html>
        <head>
          <title>Elixir Cowboy Dynamic Example</title>
        </head>
        <body>
          Entered
        </body>
        </html>
    """
  end
end
