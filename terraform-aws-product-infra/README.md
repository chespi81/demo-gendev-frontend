# Terraform AWS Product Infra

Proyecto Terraform para desplegar infraestructura base en AWS con:

- 1 instancia EC2
- 1 bucket S3 para assets de productos
- 1 distribucion CloudFront con origen en S3 usando OAC
- 5 tablas DynamoDB para almacenamiento de productos

## Recursos que se crean

- `aws_instance.product_api`
- `aws_s3_bucket.product_assets`
- `aws_cloudfront_distribution.product_assets_cdn`
- `aws_dynamodb_table.product_storage` (5 tablas):
  - `<prefix>-products`
  - `<prefix>-inventory`
  - `<prefix>-pricing`
  - `<prefix>-media`
  - `<prefix>-movements`

## Prerrequisitos

- Terraform >= 1.5.0
- Credenciales AWS configuradas en tu entorno
- Permisos IAM para crear EC2, S3, CloudFront, IAM policy doc y DynamoDB

## Uso

1. Copia el archivo de variables:

```bash
cp terraform.tfvars.example terraform.tfvars
```

2. Ajusta los valores en `terraform.tfvars`, especialmente:

- `s3_bucket_name` debe ser globalmente unico
- `ssh_cidr` debe restringirse a tu IP

3. Inicializa Terraform:

```bash
terraform init
```

4. Revisa el plan:

```bash
terraform plan -out tfplan
```

5. Aplica los cambios:

```bash
terraform apply tfplan
```

6. Para eliminar recursos:

```bash
terraform destroy
```

## Notas

- CloudFront usa el certificado default de AWS (`cloudfront.net`).
- El bucket S3 bloquea acceso publico directo; CloudFront accede mediante OAC.
- Las tablas DynamoDB usan modo `PAY_PER_REQUEST` y llaves `pk`/`sk`.
