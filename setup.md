## steps 
* Java based on spring-petclinc application 
* pull request based `develop`
* spring-petclinc apllication based create Multi stage Dockerfile on `develop` branch 

* Execute dockerfile use command 

```sh
# Create image command
docker image build -t <imagename:tag> <dockerfilename or . (. consider dockerfile)>
# Check image created or not 
docker image ls
# Lets check your image based on container runing or not its only our checking purpose
docker container run -P -d --name <container name give any name> <your image name: tag>
# Lets check container running or not means check conntainer status 
docker container ls 
```

* Now what do your image scan with trivy how to do below steps follow:-
   1. first fall install trivy in your  vm or ec2

```sh
sudo apt-get install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy -y 
```
* whenever trivy installed completed after image scan follow below command 

```bash
trivy <docker image:tag>
```
##########################################################################################
* push based `release` 
* Multiple develper changes done so we agian Scan docker image   

* On `release` branch Scan docker image with trivy
* whenever trivy installed completed after image scan follow below command 

```bash
trivy <docker image:tag>
```
above showing vulnerabilities or some reports 

* Now whenever image scan completed we are go to the image push to the Registry 
  like a docker hub or ECR or ACR.

* Now we are push to the docker hub how to do that below following steps 

```bash
docker login
docker image tag <imagename:tag> <your registry account/reponame>
docker image push <your registry account/reponame>
```

* Now ready image for the deployment so we need create a deployment folder into create a deployment manifestfile 
* deployment file execute we need cluster so setup any cloud cluster EKS OR AKS on-primese cluster
* How to execute file below command follow 
 
* 


