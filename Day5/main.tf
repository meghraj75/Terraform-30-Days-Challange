resource "aws_s3_bucket" "mybucket" {
  bucket = "${var.project_name}-${var.environment}-bucket"
  tags = var.tags

  lifecycle {
    prevent_destroy = true
    ignore_changes = [ tags ]
  }

}

resource "aws_instance" "demo_instances" {
  ami=var.ami_id
  instance_type=local.selected_instance_type
  tags = var.tags
 depends_on = [ aws_s3_bucket.mybucket ]

}

resource "aws_security_group" "demo_group" {
  name="${var.project_name}-${var.environment}-sg"
  description="Security group for ${var.project_name} in ${var.environment} environment"
   
}

resource "aws_security_group_rule" "ingress_rules" {
   count = length(var.allowd_ports)

  type        = "ingress"
  from_port   = var.allowd_ports[count.index]
  to_port     = var.allowd_ports[count.index]
  protocol    = "tcp"
  security_group_id = aws_security_group.demo_group.id
  cidr_blocks = ["0.0.0.0/0"]

}
