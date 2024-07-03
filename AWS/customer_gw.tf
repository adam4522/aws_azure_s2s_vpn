resource "aws_customer_gateway" "azure_cgw" {
  bgp_asn    = 65000
  ip_address = "4.210.16.69"
  type       = "ipsec.1"

  tags = {
    Name = "azure_cgw"
  }
}