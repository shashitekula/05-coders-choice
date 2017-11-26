defmodule PasswordService.Supervisor do

  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: PasswordService.Supervisor)
  end

  def init(_arg) do
    children = [
      worker(PasswordService.Server, [], restart: :transient)
    ]
    supervise(children, strategy: :simple_one_for_one)
  end

end