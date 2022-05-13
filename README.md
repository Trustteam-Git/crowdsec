# Crowdsec list to use on other devices
## Run it locally
You can pull the repository to setup a crowdsec API and bouncer in docker.
This will create a list of bad ip's in output/list.txt to use on other machines and updates this every minute.

### Steps
 
1) Build the docker image:   
```docker build --pull --rm -f "containers\crowdsec\DockerFile" -t crowdsec-bouncer:latest "containers\crowdsec" ```    


 
2) Use docker compose to start the containers:    
```docker compose -f "containers\crowdsec\docker-compose.yml" up -d --build```


3) Automatically copy the list.txt to a place which is available for your devices with a cronjob.
   Here I made a cronjob that pushes the list to github every hour. (containers/crowdsec/scripts/git_push.sh)

## Use this list on fortigates
I've mainly created this so fortigates can use the list without installing the software anywhere, but check the list in this repository which updates every hour.
Refer to the list on Fortigates by adding this to the cli:
```
config system external-resource
    edit "CrowdSec"
        set type address
        set resource "https://raw.githubusercontent.com/Smoetzak/crowdsec/master/output/list.txt"
    next
end
```
