defmodule Hello.ContactController do
  use Hello.Web, :controller

  alias Hello.Contact

  def index(conn, params) do
    search = Map.get(params, "search", "")

    page = Contact
      |> Contact.search(search)
      |> order_by(:first_name)
      |> Repo.paginate(params)

    render conn, page: page
  end

  def show(conn, %{"id" => id}) do
    contact = Repo.get(Contact, id)

    render conn, contact: contact
  end
end