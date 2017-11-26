defmodule PasswordService.Impl do

  def create({username, password}) do
    validate_username(username)
    |> validate_password(password)
    |> initiate
  end

  def login({username, password}, %{username: a_username, password: a_password}) do
    username
    |> check_username(a_username)
    |> check_password(password, a_password)
    |> reply
  end

  def check_username(username1, username2), do: username1 == username2

  def reply(state) when state == true, do: :success
  def reply(_state), do: :failure

  def check_password(true, password1, password2), do: password1 == password2
  def check_password(false, _, _), do: false

  def reset({username, password, newpassword}, %{username: _a_username, password: _a_password} = state) do
    login({username, password}, state)
    |> reset_password(username, newpassword)
  end

  def reset_password(:success, username, password) do
    PasswordStore.reset({username, password})
    PasswordService.Server.set_state(username, password)
  end

  def reset_password(:failure, _, _), do: "Invalid username or password. Please try again."

  def validate_password({true, username}, password) do
    { Regex.match?(~r/^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){6,10}$/,password), username,  password }
  end

  def validate_password({_, username}, password) do
    IO.inspect "in the validate password"
    IO.inspect username
    IO.inspect password

    { "Username error.", username, password }
  end

  def initiate({true, username, password}) do
    PasswordStore.create({username, password})
    Supervisor.start_child(PasswordService.Supervisor, [username, password])
  end

  def initiate({false, _, _}) do
    raise "Invalid password entered"
  end

  def initiaite({msg, _, _}), do: raise msg

  def validate_username(username) do
    IO.inspect "in the validate username"
    IO.inspect username
    {Regex.match?(~r/^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){6,10}$/,username), username }
  end

end
