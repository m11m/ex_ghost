defmodule ExGhost do
  require ExGhost.Model
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

  @spec posts() :: [ExGhost.Model.Posts]
  def posts() do
  end
end
