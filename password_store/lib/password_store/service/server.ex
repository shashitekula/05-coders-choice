defmodule PasswordStore.Service.Server do

  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def create({username, password}) do
    GenServer.call(__MODULE__, {:create, username, password})
  end

  def login({username, password}) do
    GenServer.call(__MODULE__, {:login, username, password})
  end

  def reset({username, newpassword}) do
    GenServer.call(__MODULE__, {:reset, username, newpassword})
  end

  def handle_call({:create, username, password}, _from, state) do
    {:reply, state,  PasswordStore.Service.Impl.create({username, password}, state)}
  end


  def handle_call({:login, username, password}, _from, state) do
    {:reply, PasswordStore.Service.Impl.login({username, password}, state), state}
  end


  def handle_call({:reset, username, newpassword}, _from, state) do
    {:reply, state, PasswordStore.Service.Impl.reset({username, newpassword}, state)}
  end

end
