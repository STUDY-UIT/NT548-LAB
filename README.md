# NT548 - Công nghệ DevOps và Ứng dụng

## Giới thiệu

Repository này được xây dựng phục vụ môn học **Công nghệ DevOps và Ứng dụng (NT548)** tại Trường Đại học Công nghệ Thông tin (UIT).

**Giảng viên hướng dẫn:** ThS. Lê Anh Tuấn

Mục tiêu của dự án là thực hành các công cụ Infrastructure as Code (IaC), CI/CD và Cloud Native nhằm tự động hóa quá trình triển khai hạ tầng và ứng dụng trên AWS.

---

## Thành viên nhóm 3

| STT | Họ và tên | MSSV |
|------|------------|-------|
| 1 | Đinh Công Thảo| 23521465 |
| 2 | Nguyễn Văn Tiến| 23521581 |
| 3 | Nguyễn Đình Tri| 23521642 |
| 4 | Hồ Vương Tường Vy| 23521827|

---

## Cấu trúc thư mục

```text
LAB/
├── LAB1/
│   ├── cloudformation/
│   │   ├── templates/
│   │   └── main.yaml
│   │
│   └── terraform/
│
├── LAB2/
│
├── .gitignore
└── README.md
```

---

# LAB 1 - Terraform & CloudFormation

## Mục tiêu

Triển khai tự động hạ tầng AWS bằng:

- Terraform (Module-based Architecture)
- AWS CloudFormation

## Các dịch vụ triển khai

### Network

- VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- NAT Gateway

### Routing

- Public Route Table
- Private Route Table

### Compute

- Public EC2 (Bastion Host)
- Private EC2

### Security

- Security Groups
- SSH Access Control

---

## Kiến trúc triển khai

```text
Internet
    │
    ▼
Internet Gateway
    │
    ▼
Public Subnet
    │
    ├── Bastion Host (EC2)
    │
    ▼
NAT Gateway
    │
    ▼
Private Subnet
    │
    └── Private EC2
```

### Quy tắc bảo mật

#### Public EC2

- Chỉ mở SSH (Port 22)
- Chỉ cho phép IP cá nhân truy cập

#### Private EC2

- Không có Public IP
- Chỉ nhận SSH từ Bastion Host

---

# LAB 2 - DevOps Automation

## Mục tiêu

Tự động hóa toàn bộ quy trình triển khai hạ tầng và ứng dụng.

---

## Phần 1 - Terraform + GitHub Actions

### Chức năng

- Terraform Provisioning
- GitHub Actions CI/CD
- Checkov Security Scanning

### Pipeline

```text
GitHub Push
      │
      ▼
GitHub Actions
      │
      ├── terraform fmt
      ├── terraform validate
      ├── checkov scan
      └── terraform apply
```

---

## Phần 2 - CloudFormation + AWS CodePipeline

### Chức năng

- AWS CloudFormation
- AWS CodeCommit
- AWS CodeBuild
- AWS CodePipeline

### Kiểm thử

- cfn-lint
- Taskcat

### Pipeline

```text
CodeCommit
     │
     ▼
CodePipeline
     │
     ▼
CodeBuild
     │
     ├── cfn-lint
     ├── taskcat
     └── Deploy Stack
```

---

## Phần 3 - Jenkins CI/CD cho Microservices

### Công nghệ sử dụng

- Jenkins
- Docker
- Kubernetes
- SonarQube
- Trivy / Snyk

### Pipeline

```text
GitHub
   │
   ▼
Jenkins
   │
   ├── Build
   ├── Unit Test
   ├── SonarQube
   ├── Security Scan
   ├── Docker Build
   ├── Push Image
   └── Deploy Kubernetes
```

---

# Hướng dẫn sử dụng

### Terraform

Xem:

```text
LAB/LAB1/terraform/README.md
```

### CloudFormation

Xem:

```text
LAB/LAB1/cloudformation/README.md
```

---

# Tài liệu tham khảo

- Terraform Documentation
- AWS CloudFormation Documentation
- GitHub Actions Documentation
- Jenkins Documentation
- Kubernetes Documentation

---

**Môn học:** NT548 - Công nghệ DevOps và Ứng dụng

**Giảng viên hướng dẫn:** ThS. Lê Anh Tuấn