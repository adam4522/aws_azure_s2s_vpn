resource "aws_vpn_connection" "azure_aws_s2svpn" {
  customer_gateway_id = aws_customer_gateway.azure_cgw.id
  transit_gateway_id  = aws_ec2_transit_gateway.main_tgw.id
  type                = aws_customer_gateway.azure_cgw.type
  static_routes_only = "true"
  outside_ip_address_type = "PublicIpv4"

  tags = {
    Name = "azure_aws_s2svpn"
  }
}