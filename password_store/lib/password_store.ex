defmodule PasswordApp do

  defdelegate create(user), to: PasswordApp.Service.Server
  defdelegate login(user),  to: PasswordApp.Service.Server
  defdelegate reset(user),  to: PasswordApp.Service.Server


end
