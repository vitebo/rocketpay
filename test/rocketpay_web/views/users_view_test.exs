defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true

  import Phoenix.View

  alias Rocketpay.{User, Account}
  alias RocketpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "André Vitebo",
      password: "test123",
      nickname: "vitebo",
      email: "vitebo@hotmail.com",
      age: 25,
    }

    {
      :ok,
      %User{
        id: user_id,
        account: %Account{
          id: account_id
        }
      } = user
    } = Rocketpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        id: user_id,
        name: "André Vitebo",
        nickname: "vitebo",
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        }
      }
    }

    assert expected_response == response
  end
end
