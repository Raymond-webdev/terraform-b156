variable "message" {
  description = "Text to write into the generated file."
  type        = string
  default     = "Hello from Terraform!"
}

variable "output_file" {
  description = "Path of the text file Terraform manages."
  type        = string
  default     = "terraform-learning-output.txt"
}