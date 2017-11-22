defmodule PasswordApp.Service.Impl do

  def create({username, password}) do
    validate_username(username)
    |> validate_password(password)
    |> update_state
  end


  def login({username, password}) do
    username
    |> get_user
    |> check_password(password)
    |> reply
  end

  def get_user(username) do
    Agent.get(PasswordApp.Store.Server, fn store ->
      Enum.find(store, fn x ->  x.username == username end)
    end)
  end

  def reply(state) when state == true, do: :success
  def reply(_state), do: :failure

  def check_password(user, password) do
    user.password == password
  end

  def reset({username, password, newpassword}) do
    login({username, password})
    |> reset_password(username, newpassword)
  end

  def reset_password(:success, username, newpassword) do
    user = get_user(username)
    Agent.update(PasswordApp.Store.Server, fn store ->
      List.delete(store, user)
    end)
    update_state({true, username, newpassword})
  end


  def validate_password({true, username}, password) do
    { Regex.match?(~r/^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){6,10}$/,password), username,  password }
  end

  def validate_password({_, username}, password) do
    { "Username error.", username, password }
  end

  def update_state({true, username, password}) do
    Agent.update(PasswordApp.Store.Server, fn store ->
      [
        %PasswordApp.Store.State {
          username: username,
          password: password
        }
        | store
      ]
    end)
  end
  
  def update_state({ false, _username, _password}) do
     "Password argument value is invalid."
  end

  def update_state({error, _, _}) do
    error
  end

  def validate_username(username) do
    {Regex.match?(~r/^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){6,10}$/,username), username }
  end

end
