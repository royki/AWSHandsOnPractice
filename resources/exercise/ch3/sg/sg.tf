variable "ingressrules" {
    type = list(number)
    default = [80,443]
}

variable "engressrules" {
    type = list(number)
    default = [80,443]
}

output "sg_name" {
    value = aws_security_group.sg_webtraffic.name
}

resource "aws_security_group" "sg_webtraffic" {
    name = "Allow HTTPS"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingressrules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
    dynamic "egress" {
        iterator = port
        for_each = var.engressrules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}