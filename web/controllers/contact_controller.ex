defmodule Hello.ContactController do
  use Hello.Web, :controller

  alias Hello.Contact

  def index(conn, params) do
    page = Contact
      |> order_by(:first_name)
      |> Repo.paginate(params)

    render conn, page: page
  end
end