defmodule ExAws.Acm.RequestCertificatePayloadTest do
  use ExUnit.Case
  alias ExAws.Acm.RequestCertificatePayload

  test "to_map/1" do
    payload = %RequestCertificatePayload{
      domain_name: "foo.bar.com",
      validation_method: "DNS"
    }

    expected = %{
      "DomainName" => "foo.bar.com",
      "ValidationMethod" => "DNS"
    }

    assert RequestCertificatePayload.to_map(payload) == expected
  end
end
