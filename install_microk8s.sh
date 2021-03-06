// reference : https://microk8s.io/docs/clustering
// https://blog.naver.com/manulsan/222604948960
sudo snap install microk8s --classic --channel=latest/stable
sudo ufw allow in on cni0 && sudo ufw allow out on cni0
sudo ufw default allow routed
sudo microk8s enable dns dashboard storage ingress
sudo microk8s kubectl get all --all-namespaces
#token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
#sudo microk8s kubectl -n kube-system describe secret $token
#sudo microk8s kubectl create deployment microbot --image=dontrebootme/microbot:v1
#sudo microk8s kubectl scale deployment microbot --replicas=2
#sudo microk8s kubectl expose deployment microbot --type=NodePort --port=80 --name=microbot-service
sudo microk8s kubectl get all --all-namespaces
# microk8s.add-node\
# microk8s join 192.168.123.233:25000/dfc4def0d3216ff52e656d80acecf4cd/3da3a9bd0208 --worker

sudo usermod -a -G microk8s $USER
cd $HOME
mkdir .kube
cd .kube
microk8s config > config
sudo chown -f -R $USER ~/.kube

# uninstall microk8s
 sudo snap remove microk8s
