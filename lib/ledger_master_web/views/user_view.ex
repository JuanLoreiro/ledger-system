defmodule LedgerMasterWeb.UserView do
  use LedgerMasterWeb, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, LedgerMasterWeb.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, LedgerMasterWeb.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      email: user.email
    }
  end
end
