defmodule PasswordAppTest do
  use ExUnit.Case
  doctest PasswordApp



  setup do
    PasswordApp.PasswordService.start_link()
    PasswordApp.PasswordService.create("sha", "1234")
    PasswordApp.PasswordService.create("var", "1239")
  end

  test "unlock success test" do
    assert "success" == PasswordApp.PasswordService.login("sha","1234")
  end



end
