defmodule Screamer.Conversation do
  use Screamer.Web, :model

  @primary_key {:id, :binary_id, autogenerate: false}
  @foreign_key_type :binary_id
  schema "conversations" do
    field :name, :string
    has_many :messages, Screamer.Message
    timestamps
  end

  @required_fields ~w(id name)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
