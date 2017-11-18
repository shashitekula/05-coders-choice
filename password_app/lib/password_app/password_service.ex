defmodule PasswordApp.PasswordService do
    use GenServer


    def start_link() do
      GenServer.start_link(__MODULE__, [], name: __MODULE__)
    end

    def create(username, password) do
      GenServer.call(__MODULE__, {:create, username, password})
    end

    def login(username, password) do
      GenServer.call(__MODULE__, {:login, username, password})
    end



    def handle_call({:create, username, password}, _from, state) do
      {:reply, PasswordApp.Passwords.create(username, password), state}
    end


    def handle_call({:login, username, password}, _from, state) do
      {:reply, PasswordApp.Passwords.login(username, password), state}
    end


end
