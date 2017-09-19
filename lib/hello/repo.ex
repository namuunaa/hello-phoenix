defmodule Hello.Repo do
  use Ecto.Repo, otp_app: :hello

  use Scrivener, page_size: 9
end
