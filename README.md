# Elixir cowboy api calls storage example

# WHY

I was wondering how use some sharing resources between API calls in Elixir. I didn't want to use
`phoenix` framework as I used it before, so I picked `cowboy` instead.

# How data is shared

Data is shared in supervised `GenServer`.
Most of the code is taken from documentation of (Elixir GenServer)[https://hexdocs.pm/elixir/1.12/GenServer.html#c:handle_call/3] but the part with `cowboy` is something I come up by discovering many examples available on github.

# How to build and run
```
mix deps.get
iex -S mix
```

To query API you need to
```
curl localhost:4000/restHeaders
```

