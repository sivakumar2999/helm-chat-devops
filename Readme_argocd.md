Install ArgoCD on the EKS cluster:
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml


Expose the ArgoCD API server:

kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

Get the ArgoCD API server endpoint:
kubectl get svc argocd-server -n argocd

Get the ArgoCD admin password:
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

Login to ArgoCD:
argocd login <argocd-server>:443

Create an ArgoCD application:
You can create an ArgoCD application using the argocd app create command. Here's an example:

argocd app create demo-app \
    --repo https://github.com/argoproj/argocd-example-apps.git \
    --path guestbook \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace default


    Sync the ArgoCD application:
argocd app sync demo-app

Please replace <argocd-server> with your actual ArgoCD API server endpoint, and adjust the other commands according to your setup.

Note: This is a basic setup for testing purposes. For a production setup, you should secure the ArgoCD API server with TLS and authentication.

 stage('Push Helm Chart to ECR') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'ecrCredentials', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <your-ecr-repository-url>'
                    sh 'docker save -o gen-app.tar <your-ecr-repository-url>/gen-app:latest'
                    sh 'aws s3 cp gen-app.tar s3://<your-s3-bucket>/gen-app.tar'
                    sh 'argocd app create gen-app --repo https://github.com/<your-github-repo> --path helm-chart --dest-server https://<your-argocd-server> --dest-namespace <your-argocd-namespace> --helm-set image.repository=<your-ecr-repository-url>/gen-app,image.tag=latest'
                    sh 'argocd app sync gen-app'
                }
            }
        }