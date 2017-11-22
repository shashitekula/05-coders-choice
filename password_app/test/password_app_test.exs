defmodule PasswordAppTest do
  use ExUnit.Case
  doctest PasswordApp


  test "unlock success test" do
    PasswordApp.create({"Shashi1var", "Shashi1var"})
    assert :success == PasswordApp.login({"Shashi1var","Shashi1var"})
  end

  test "unlock failure test" do
    PasswordApp.create({"Shashi2var", "Shashi1var"})
    assert :failure == PasswordApp.login({"Shashi2var","Shashi3var"})
  end

  test "Invalid user test" do
  assert "Username error."  ==  PasswordApp.create({"sas", "Shashi1var"})

  end

  test "Invalid password test" do
    assert "Password argument value is invalid." ==  PasswordApp.create({"Shashi10v", "sas"})

  end

  test "reset password" do
    assert :ok == PasswordApp.reset({"Shashi1var", "Shashi1var", "heya"})
  end

end
