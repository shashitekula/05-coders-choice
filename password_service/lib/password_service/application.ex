defmodule PasswordService.Application do

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(PasswordService.Supervisor, [])
    ]
    opts = [strategy: :one_for_one]
    Supervisor.start_link(children, opts)
  end

end
