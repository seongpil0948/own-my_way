## Architecture
- Web Tier: Amazon EC2 Auto Scaling 그룹과 Elastic Load Balancer (ELB)를 활용
- Application Tier: 또 다른 EC2 Auto Scaling 그룹을 사용하여 애플리케이션 서버 운영
- Data Tier: Amazon RDS에서 MySQL 8 데이터베이스 인스턴스 사용
- Bastion Host: 보안을 위해 접근 제어 및 관리를 수행할 별도의 EC2 인스턴스 사용
- Security Groups: 각 Tier의 보안 그룹을 구성하여 네트워크 액세스 제어
