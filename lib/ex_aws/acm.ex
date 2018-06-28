defmodule ExAws.Acm do
  @moduledoc """
  Operations on AWS ACM
  """

  alias ExAws.Acm.RequestCertificatePayload
  alias ExAws.Operation.JSON

  @namespace "CertificateManager"

  @doc """
  Describe a Certificate:
  https://docs.aws.amazon.com/acm/latest/APIReference/API_DescribeCertificate.html
  """
  @spec describe_certificate(binary) :: JSON.t()
  def describe_certificate(certificate_arn) do
    request(%{CertificateArn: certificate_arn}, :describe_certificate)
  end

  @spec request_certificate(binary(), keyword) :: JSON.t()
  def request_certificate(domain_name, opts \\ []) do
    %RequestCertificatePayload{domain_name: domain_name}
    |> struct(opts)
    |> RequestCertificatePayload.to_map()
    |> request(:request_certificate)
  end

  @spec list_certificates(keyword) :: JSON.t()
  def list_certificates(_opts \\ []) do
    request(%{}, :list_certificates)
  end

  defp request(data, op, opts \\ %{}) do
    operation =
      op
      |> Atom.to_string()
      |> Macro.camelize()

    JSON.new(
      :acm,
      %{
        data: data,
        headers: [
          {"x-amz-target", "#{@namespace}.#{operation}"},
          {"content-type", "application/x-amz-json-1.1"}
        ]
      }
      |> Map.merge(opts)
    )
  end
end
