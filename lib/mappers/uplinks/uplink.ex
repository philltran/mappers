defmodule Mappers.Uplinks.Uplink do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [
    :app_eui,
    :dev_eui,
    :device_id,
    :fcnt,
    :first_timestamp,
    :frequency,
    :gps_accuracy,
    :spreading_factor
  ]

  @derive {Jason.Encoder, only: @fields}
  @primary_key {:id, Ecto.UUID, autogenerate: true}
  schema "uplinks" do
    field :app_eui, :string
    field :dev_eui, :string
    field :device_id, :string
    field :fcnt, :integer
    field :first_timestamp, :utc_datetime_usec
    field :frequency, :float
    field :gps_accuracy, :integer
    field :spreading_factor, :string
  end

  @doc false
  def changeset(uplink, attrs) do
    uplink
    |> cast(attrs, [:dev_eui, :app_eui, :device_id, :fcnt, :frequency, :spreading_factor, :gps_accuracy, :first_timestamp])
    |> validate_required([:dev_eui, :app_eui, :device_id, :fcnt, :frequency, :spreading_factor, :gps_accuracy, :first_timestamp])
  end
end
