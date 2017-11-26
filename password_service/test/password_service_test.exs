defmodule PasswordServiceTest do
  use ExUnit.Case
  doctest PasswordService

#  test "unlock success test" do
#    PasswordService.create {"Shashi1var", "Shashi1var"}
#    assert :success == PasswordService.login({"Shashi1var","Shashi1var"})
#  end
#
#  test "unlock failure test" do
#    PasswordService.create({"Shashi2var", "Shashi1var"})
#    assert :failure == PasswordService.login({"Shashi2var","Shashi3var"})
#  end

#  test "Invalid user test" do
#    assert "Username error."  ==  PasswordService.create({"sas", "Shashi1var"})
#
#  end
#
  test "Invalid password test" do
    assert "Password argument value is invalid." ==  PasswordService.create({"Shashi10v", "sas"})

  end
#
#  test "reset password" do
#    PasswordService.create({"Shashi3var", "Shashi3pas"})
#    assert :ok == PasswordService.reset({"Shashi3var", "Shashi3pas", "Shashi3ch"})
#
#  end


end
