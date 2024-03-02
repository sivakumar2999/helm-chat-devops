## helm-chat-devops

# 1. Generate java 17 app using https://start.spring.io/

# 2.DockerFile

# 3.Generate helm chat using below commands
 helm create amaze-app

# 4. update app value in Chart.yml and values.yaml chat file like

# 5. deploy eks
# Install AWS CLI and configure your AWS credentials
aws configure

# Update kubeconfig
aws eks --region region update-kubeconfig --name cluster_name

# Check if your kubectl is now set to use your EKS cluster
kubectl config get-contexts

# Go to the directory where your Helm chart is located
cd /path/to/your/helm/chart

# Install your Helm chart
helm install my-release .