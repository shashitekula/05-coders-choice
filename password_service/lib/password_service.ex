defmodule PasswordService do

  defdelegate create(user), to: PasswordService.Impl
  defdelegate login(user),  to: PasswordService.Server
  defdelegate reset(user),  to: PasswordService.Server

end
