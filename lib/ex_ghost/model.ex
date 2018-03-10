defmodule ExGhost.Model do
  @external_resource schema_path = "priv/ghost/schema.json"

  File.read!(schema_path)
  |> Poison.decode!()
  |> Map.to_list()
  |> Enum.each(fn {k, v} ->
    fields =
      Map.to_list(v)
      |> Enum.map(fn {k, _} ->
        {String.to_atom(k), nil}
      end)

    quote do
      defmodule unquote(String.to_atom("#{__MODULE__}.#{String.capitalize(k)}")) do
        defstruct unquote(fields)
      end
    end
    |> Code.eval_quoted()
  end)
end
