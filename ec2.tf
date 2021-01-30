data "aws_ami" "debian" {

  most_recent = true
 
  filter {
    name   = "name"
    values = ["debian-10-amd64-*"]
  }

  owners = [ "136693071363" ] #Debian oficial

}

resource "aws_instance" "k8s" {
    count         = var.contador
    ami           = data.aws_ami.debian.id
    instance_type = var.tipo_recurso
    key_name      = "chave_aws"
    tags          = {
      for_each    = toset ( var.nome_no )
      Name        = each.key
    }
}
