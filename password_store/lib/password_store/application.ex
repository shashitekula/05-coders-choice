defmodule PasswordApp.Application do

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    children = [
      worker(PasswordApp.Service.Server, [])
    ]

    opts = [strategy: :one_for_one, name: PasswordApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
