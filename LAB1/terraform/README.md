# LAB 1 - Terraform

## Giới thiệu

Thư mục này chứa mã nguồn Terraform triển khai hạ tầng AWS theo kiến trúc Infrastructure as Code (IaC).

Toàn bộ tài nguyên được xây dựng dưới dạng **Terraform Modules** nhằm tăng khả năng tái sử dụng và quản lý.

---

## Kiến trúc triển khai

```text
VPC
├── Public Subnet
│   ├── Bastion Host
│   └── NAT Gateway
│
└── Private Subnet
    └── Private EC2
```

---

# Yêu cầu môi trường

## Cài đặt Terraform

Kiểm tra phiên bản:

```bash
terraform version
```

---

## Cài đặt AWS CLI

Kiểm tra:

```bash
aws --version
```

---

# Chuẩn bị cấu hình

## Bước 1: Clone repository

```bash
git clone https://github.com/dinhtri6905/NT548-LAB
```

Di chuyển vào thư mục:

```bash
cd LAB/LAB1/terraform
```

---

## Bước 2: Tạo file terraform.tfvars

Copy file mẫu:

```bash
cp terraform.tfvars.example terraform.tfvars
```

---

## Bước 3: Cập nhật thông tin cá nhân

Mở file:

```text
terraform.tfvars
```

Điền các giá trị:

```hcl
my_ip         = "xxx.xxx.xxx.xxx"
key_name      = "NT548-LAB-KEYPAIR"

aws_access_key = "xxxxxxxxxxxxxxxxxxxxxxxx"
aws_secret_key = "xxxxxxxxxxxxxxxxxxxxxxxx"
```

### Giải thích

| Biến | Ý nghĩa |
|--------|---------|
| my_ip | Public IP của máy cá nhân |
| key_name | Tên EC2 Key Pair |
| aws_access_key | AWS Access Key |
| aws_secret_key | AWS Secret Key |

---

## Cách lấy Public IP

Truy cập:

```text
https://www.whatsmyip.com/
```

Ví dụ:

```text
203.167.11.135
```

Không cần thêm:

```text
/32
```

Terraform sẽ tự xử lý.

---

# Triển khai hạ tầng

## Khởi tạo Terraform

```bash
terraform init
```

---

## Kiểm tra kế hoạch triển khai

```bash
terraform plan
```

Terraform sẽ hiển thị:

- Tài nguyên tạo mới
- Tài nguyên cập nhật
- Tài nguyên bị xóa

---

## Triển khai thực tế

```bash
terraform apply --auto-approve
```

---

# Kiểm tra kết quả

## Liệt kê tài nguyên

```bash
terraform state list
```

---

## Xem Output

```bash
terraform output
```

Ví dụ:

```text
public_instance_ip
private_instance_ip
```

---

# Kiểm thử SSH

## SSH vào Bastion Host

```bash
ssh -i mykey.pem ec2-user@<PUBLIC_IP>
```

hoặc

```bash
ssh -i mykey.pem ubuntu@<PUBLIC_IP>
```

---

## SSH vào Private EC2

Từ Bastion Host:

```bash
ssh -i mykey.pem ec2-user@<PRIVATE_IP>
```

---

# Hủy hạ tầng sau khi hoàn thành

```bash
terraform destroy
```

---

# Một số lệnh hữu ích

## Format code

```bash
terraform fmt -recursive
```

## Validate

```bash
terraform validate
```

## Hiển thị State

```bash
terraform show
```
