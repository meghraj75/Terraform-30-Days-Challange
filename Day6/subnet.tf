resource "aws_subnet" "first" {
  vpc_id            = data.aws_vpc.default.id
  cidr_block        = local.first_subnet
  availability_zone = data.aws_availability_zones.default.names[0]
}

resource "aws_subnet" "second" {
  vpc_id            = data.aws_vpc.default.id
  cidr_block        = local.last_subnet
  availability_zone = data.aws_availability_zones.default.names[1]
}

resource "aws_subnet" "third" {
  vpc_id            = data.aws_vpc.default.id
  cidr_block        = local.first_two_subs[1]
  availability_zone = data.aws_availability_zones.default.names[2]
}