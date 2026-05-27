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

### Sau đó upload:
```bash
aws s3 cp .\templates\ s3://your-bucket/templates/ --recursive
```

### Deploy:
```bash
aws cloudformation create-stack `
--stack-name nt548-lab `
--template-body file://main.yaml `
--parameters `
ParameterKey=MyIp,ParameterValue=113.xxx.xxx.xxx/32 `
ParameterKey=KeyName,ParameterValue=mykey `
ParameterKey=TemplatesBucketUrl,ParameterValue=https://your-bucket.s3.ap-southeast-1.amazonaws.com
```


