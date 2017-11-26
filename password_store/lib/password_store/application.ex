defmodule PasswordStore.Application do

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    children = [
      worker(PasswordStore.Service.Server, [])
    ]

    opts = [strategy: :one_for_one, name: PasswordStore.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
