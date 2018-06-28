defmodule ExAws.AcmTest do
  use ExUnit.Case
  alias ExAws.Acm
  alias ExAws.Operation

  test "describe_certificate/1" do
    cert_arn = "Mock Cert ARN!"

    operation = Acm.describe_certificate(cert_arn)

    expected = %Operation.JSON{
      service: :acm,
      data: %{
        CertificateArn: cert_arn
      },
      headers: [
        {"x-amz-target", "CertificateManager.DescribeCertificate"},
        {"content-type", "application/x-amz-json-1.1"}
      ],
      # Default anonymous function
      parser: operation.parser
    }

    assert operation == expected
  end

  test "request_certificate/1" do
    operation = Acm.request_certificate("bar.foo.com", validation_method: "DNS", non_key: :foo)

    expected = %Operation.JSON{
      service: :acm,
      data: %{
        "DomainName" => "bar.foo.com",
        "ValidationMethod" => "DNS"
      },
      headers: [
        {"x-amz-target", "CertificateManager.RequestCertificate"},
        {"content-type", "application/x-amz-json-1.1"}
      ],
      # Default anonymous function
      parser: operation.parser
    }

    assert operation == expected
  end

  test "list_certificates/0" do
    operation = Acm.list_certificates()

    expected = %Operation.JSON{
      service: :acm,
      data: %{},
      headers: [
        {"x-amz-target", "CertificateManager.ListCertificates"},
        {"content-type", "application/x-amz-json-1.1"}
      ],
      # Default anonymous function
      parser: operation.parser
    }

    assert operation == expected
  end
end
