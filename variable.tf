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
    type        = list(string)
    default     = ["t2.micro","t2.medium"]
    description = "List of instance type"
}