defmodule PasswordService.Server do

  use GenServer

  def start_link(username, password) do
    GenServer.start_link(__MODULE__, set_state(username, password), name: get_name(username))
  end

  def login({username, password}) do
    GenServer.call(get_name(username), {:login, username, password})
  end

  def reset({username, password, newpassword}) do
    GenServer.call(get_name(username), {:reset, username, password, newpassword})
  end

  def handle_call({:login, username, password}, _from, state) do
    {:reply, PasswordService.Impl.login({username, password}, state), state}
  end

  def handle_call({:reset, username, password, newpassword}, _from, state) do
    {:reply, state, PasswordService.Impl.reset({username, password, newpassword}, state) }
  end

  defp get_name(username) do
    { :global, { :passwords, username } }
  end

  def set_state(username, password) do
    %PasswordStore.Store.State {
      username: username,
      password: password
    }
  end

end
