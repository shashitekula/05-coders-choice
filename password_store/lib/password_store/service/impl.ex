defmodule PasswordStore.Service.Impl do

  def create(tuple, state) do
    tuple
    |> update_state(state)
  end

  def login({username, password}, state) do
    username
    |> get_user(state)
    |> check_password(password)
    |> reply
  end

  def get_user(username, store) do
    Enum.find(store, fn x ->  x.username == username end)
  end

  def reply(state) when state == true, do: :success
  def reply(_state), do: :failure

  def check_password(user, password) do
    user.password == password
  end

  def reset({username, newpassword}, store) do
    user = get_user(username, store)
    store = List.delete(store, user)
    update_state({username, newpassword}, store)
  end

  def update_state({username, password}, store) do
      [
        %PasswordStore.Store.State {
          username: username,
          password: password
        }
        | store
      ]
  end
  
end
