defmodule ExGhost do
  # https://elixirforum.com/t/elixir-macros-easy-to-understand-painful-to-implement/3327/5
  require ExGhost.Model
  alias ExGhost.Model.{Post}

  use Application

  def start(_type, _args) do
    ExGhost.Supervisor.start_link()
  end

  @spec configure(Keyword.t()) :: :ok
  def configure(kwlist) do
    Enum.each(kwlist, fn {k, v} ->
      Application.put_env(:ex_ghost, k, v)
    end)

    :ok
  end

  @spec posts() :: [Post.t()]
  def posts() do
    [%Post{}]
  end
end
