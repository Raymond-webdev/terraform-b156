output "file_path" {
  description = "Path to the file managed by Terraform."
  value       = local_file.lesson.filename
}

output "file_content" {
  description = "Content written into the managed file."
  value       = local_file.lesson.content
}