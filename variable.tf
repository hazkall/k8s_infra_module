variable "contador" {
    type = string
    default = 1
    description = "Contagem de instancias a criar"
}

variable "nome_no" {
    type        = list(string)
    default     = []
    description = "Nome dos nós do k8s"
}

variable "tipo_recurso" {
    type        = string
    default     = "t2.micro"
    description = "Tipo de recurso do EC2"
}