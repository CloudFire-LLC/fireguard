defmodule FzHttp.Sessions do
  @moduledoc """
  The Sessions context.
  """

  import Ecto.Query, warn: false
  alias FzHttp.Repo

  alias FzHttp.Users.Session

  @doc """
  Gets a single session.

  Raises `Ecto.NoResultsError` if the Session does not exist.

  ## Examples

      iex> get_session!(123)
      %Session{}

      iex> get_session!(456)
      ** (Ecto.NoResultsError)

  """
  def get_session!(email: email), do: Repo.get_by!(Session, email: email)
  def get_session!(id), do: Repo.get!(Session, id)
  def get_session(email: email), do: Repo.get_by(Session, email: email)
  def get_session(id), do: Repo.get(Session, id)

  def new_session do
    Session.changeset(%Session{}, %{})
  end

  @doc """
  Creates a session.

  ## Examples

      iex> create_session(%{field: value})
      {:ok, %Session{}}

      iex> create_session(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_session(%Session{} = session, %{} = attrs) do
    session
    |> Session.create_changeset(attrs)
    |> Repo.update()
  end
end
