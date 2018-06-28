defmodule ExAws.Acm.RequestCertificatePayload do
  @moduledoc """
  A struct for a certificate request parameters.
  """

  @enforce_keys [:domain_name]
  defstruct [:domain_name, :validation_method]

  @type t :: %__MODULE__{
          domain_name: binary()
        }

  @spec to_map(t) :: map()
  def to_map(payload) do
    for {k, v} <- Map.from_struct(payload), into: %{} do
      {Macro.camelize("#{k}"), v}
    end
  end
end
