defmodule PasswordApp.PasswordStore do

  use GenServer

  def start_link() do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end


end
