output "smtp_user" {
  value = module.mojobooth-sendmail.smtp_user
}

output "smtp_password" {
  sensitive = true
  value     = module.mojobooth-sendmail.smtp_password
}