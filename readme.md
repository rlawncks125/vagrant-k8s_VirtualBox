# 서론

쿠버네티스를 공부하기 위한 기본 환경을 설정 하여 공유하고자 합니다.

minikube를 사용하여 간단하게 환경을 구성할수 있지만

저 처럼 마스터 노드와 워커 노드 환경을 구성하고 싶은 분들께 도움이 되기를 바랍니다.

# 실행 환경 ( 2024-09-08 )

```
host 환경
OS : window 11
cpu : 6코어 12스레드
ram : 16b
```

```
가상 머신 환경
OS : ubutun 20.04 lts
Docker : 24.04
kubernetes : 1.30
```

# 0 . 기본 환경 설정

1. [vagrant 설치](https://developer.hashicorp.com/vagrant/install?product_intent=vagrant)
2. VirtualBox **관리자 권한**으로 실행

# 1. 시작

```bash
# 1. git 레포지토리 클론
git clone https://github.com/rlawncks125/vagrant-k8s_VirtualBox.git
cd vagrant-k8s_VirtualBox

# 2. vagrant file 실행
vagrant up
```

# 2. Master Node 초기화

```bash
# 1. master node 머신 접근
vagrant ssh master

# 2. k8s 초기화
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.50.10

# 3. 초기화 완료시 출력값 저장
# ex )
kubeadm join 192.168.50.10:6443 --token jqs8vj.vxqf695988pd \
 --discovery-token-ca-cert-hash sha256:052ebad1e3a9dc4ae0d44045d4327020197de08d387e73afd80ed91d

```

# 3. Worker Node 등록

```bash
# 1. 워커 노드 접근
vagrant ssh node-1
vagrant ssh node-2 ....

# 2. master 노드에 참여
# master 초기화시 출력값
sudo kubeadm join 192.168.50.10:6443 --token jqs8vj.vxqf695988pd \
 --discovery-token-ca-cert-hash sha256:052ebad1e3a9dc4ae0d44045d4327020197de08d387e73afd80ed91d

```

# 4. Master Node 세팅

```bash
# 1. 마스터 노드 접근
vagrant ssh master

# 2. 실행 파일로 변경
chmod +x terminal.sh
chmod +x plugin.sh

# 3. 파일 실행
./terminal.sh
source ~/.bashrc
./plugin.sh

```

# 5. 테스트

해당 파일은 node pod를 3개 띄워 로드 밸런스가 동작 되는지 확인 합니다.

```bash

# 1 테스트 파일 적용
kubectl apply -f test-node.yaml

# 2. 요청 확인
curl 127.0.0.1:30888
```
![image](https://github.com/user-attachments/assets/443a3644-62fc-4e9f-8532-fbe30c146400)

