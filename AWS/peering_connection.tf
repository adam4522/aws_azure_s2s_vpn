/*
resource "aws_vpc_peering_connection" "peer" {
  peer_owner_id = "982899630122"
  peer_vpc_id   = aws_vpc.vpc_b.id
  vpc_id        = aws_vpc.vpc_a.id

  tags = {Name = "vpc_a_b_peer"}
}
*/

#This creates a vpc peering connection between vpc and vpc b, the route tables (private/public) should be adjusted accordingly