defmodule PasswordApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    import Supervisor.Spec, warn: false
    children = [
      # Starts a worker by calling: PasswordApp.Worker.start_link(arg)
      # {PasswordApp.Worker, arg},
      worker(PasswordApp.PasswordStore, []),
      worker(PasswordApp.PasswordService, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PasswordApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
