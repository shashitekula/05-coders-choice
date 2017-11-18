defmodule PasswordApp.Passwords do

  def create(username, password) do
    Agent.update(PasswordApp.PasswordStore, fn store ->
      [
        %PasswordApp.State {
          username: username,
          password: password
        }
      | store
      ]
    end)
  end

  def login(username, password) do
    Agent.get(PasswordApp.PasswordStore, fn store ->
      Enum.find(store, fn x ->  x.username == username end)
    end)
    |> check_password(password)
    |> reply

  end

  def reply(state) when state == true, do: "success"
  def reply(_state), do: "failure"

  def check_password(user, password) do
    user.password == password
  end


end
