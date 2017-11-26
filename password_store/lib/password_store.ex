defmodule PasswordStore do

  defdelegate create(user), to: PasswordStore.Service.Server
  defdelegate login(user),  to: PasswordStore.Service.Server
  defdelegate reset(user),  to: PasswordStore.Service.Server


end
