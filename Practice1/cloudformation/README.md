```bash
cloudformation/
│
├── templates/
│   ├── vpc.yaml
│   ├── nat_gateway.yaml
│   ├── route_table.yaml
│   ├── security-group.yaml
│   └── ec2.yaml
│
└── main.yaml
```

### Bước 1: Tạo S3 bucket

Ví dụ:
```bash
aws s3 mb s3://nt548-cf-template-bucket --region ap-southeast-1
```

Kiểm tra:
```bash
aws s3 ls
```

### Bước 2: Upload thư mục templates

Chạy:
```bash
aws s3 cp .\templates\ s3://nt548-cf-template-bucket/templates/ --recursive
```

Kiểm tra:
```bash
aws s3 ls s3://nt548-cf-template-bucket/templates/
```

#### Sẽ thấy
- ec2.yaml
- nat_gateway.yaml
- route_table.yaml
- security-group.yaml
- vpc.yaml

### Bước 3: Lấy IP public của bạn

Mở:
https://whatsmyip.com

Ví dụ IP:
113.161.25.100

Vì bạn đang thiết kế:
Fn::Sub: "${MyIp}/32"

nên chỉ nhập:
113.161.25.100 (không thêm /32)

### Bước 4: Tạo Key Pair trên AWS Console

Vào:
EC2
→ Key Pairs
→ Create Key Pair

!!!!! Key pair đã gửi trong nhóm: NT548-LAB-KEYPAIR !!!!!

### Bước 5: Deploy stack

Chạy:
```bash
aws cloudformation create-stack `
--stack-name nt548-lab `
--template-body file://main.yaml `
--parameters `
ParameterKey=MyIp,ParameterValue=203.167.11.135 `
ParameterKey=KeyName,ParameterValue=NT548-LAB-KEYPAIR `
ParameterKey=TemplatesBucketUrl,ParameterValue=https://nt548-cf-template-bucket.s3.ap-southeast-1.amazonaws.com
```

aws cloudformation update-stack `
--stack-name nt548-lab `
--template-body file://main.yaml `
--parameters `
ParameterKey=MyIp,ParameterValue=203.167.11.135 `
ParameterKey=KeyName,ParameterValue=NT548-LAB-KEYPAIR `
ParameterKey=TemplatesBucketUrl,ParameterValue=https://nt548-cf-template-bucket.s3.ap-southeast-1.amazonaws.com

### Bước 6: Theo dõi tiến trình

```bash
aws cloudformation describe-stacks `
--stack-name nt548-lab
```

Hoặc trên AWS Console:
```bash
CloudFormation
→ Stacks
→ nt548-lab
→ Events
```

### Bước 7: Lấy IP EC2
```bash
aws cloudformation describe-stacks `
--stack-name nt548-lab `
--query "Stacks[0].Outputs"
```

Ví dụ:
```bash
[
 {
   "OutputKey":"PublicEC2IP",
   "OutputValue":"54.xxx.xxx.xxx"
 }
]
```

### Bước 8: SSH vào Bastion (Public EC2)

Windows PowerShell:
```bash
ssh -i .\mykey.pem ec2-user@54.xxx.xxx.xxx
```

Nếu dùng Ubuntu AMI:
```bash
ssh -i .\mykey.pem ubuntu@54.xxx.xxx.xxx
```

### Bước 9: SSH từ Bastion → Private EC2

Trong Bastion:
```bash
ssh -i mykey.pem ec2-user@10.0.2.xxx
```

Nếu SSH thành công:
|Public EC2 → Private EC2|

