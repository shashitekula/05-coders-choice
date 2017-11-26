defmodule PasswordStoreTest do
  use ExUnit.Case
  doctest PasswordStore


  test "unlock success test" do
    PasswordStore.create({"Shashi1var", "Shashi1var"})
    assert :success == PasswordStore.login({"Shashi1var","Shashi1var"})
  end

  test "unlock failure test" do
    PasswordStore.create({"Shashi2var", "Shashi1var"})
    assert :failure == PasswordStore.login({"Shashi2var","Shashi3var"})
  end

  test "Invalid user test" do
  assert "Username error."  ==  PasswordStore.create({"sas", "Shashi1var"})

  end

  test "Invalid password test" do
    assert "Password argument value is invalid." ==  PasswordStore.create({"Shashi10v", "sas"})

  end

  test "reset password" do
    assert :ok == PasswordStore.reset({"Shashi1var", "Shashi1var", "heya"})
  end

end
