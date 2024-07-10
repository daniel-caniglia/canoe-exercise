# Hello World API Service

This is an API service with 3 endpoints using Flask.

## Endpoints

- `GET /hello_world`: Returns the message "Hello World!"
- `GET /current_time?name=some_name`: returns a timestamp and a customized message
- `GET /healthcheck`: validate if the service is up and running

## Folder Structure

 Under the application folder you will find everything related to the application itself, like the code and the Dockerfile
 Under aws_environment folder you will find evrything related to the IaC configurations with Terraform

## Building the Docker Image in a local computer
In the terminal of your preference, run the following commands

docker build -t hello-world-api .

## Running the Docker container locally and in the background for testing
In the terminal of your preference, run the following commands

docker run -d -p 5000:5000 hello-world-api

## Testing the endpoints
In the terminal of your preference, run the following commands to check every endpoint and the status

For `GET /hello_world`: curl http://localhost:5000/hello_world
For `GET /current_time?name=some_name`: curl http://localhost:5000/current_time?name=some_name
For `GET /healthcheck`: curl -i http://localhost:5000/healthcheck

## Taging the application

Once performed test succed, you can start the tag and push process. Being this is an excersise, I am not going to use any specific tag strategy more than just using "latest", but in a real world scenario is recommended to have a tag strategy in place, which could be from using an incremental number based on releases of our application up to using the commit hash in order to identify images with commit changes.
 Please replace <your_ecr_repository> with your own ECR repository, assuming that we will be using AWS.

docker tag hello-world-api:latest <your_ecr_repository>:latest

## Pushing the application to the ECR
First you need to have permissions in the ECR repository, so it is mandatory the installacion of the AWS CLI v2 in order to login to AWS with our credentials as is being shown in the first command

aws ecr get-login-password --region <your_region> | docker login --username AWS --password-stdin <your_ecr_repository>
docker push <your_aws_account_id>.dkr.ecr.<your_aws_region>.amazonaws.com/hello-world-api:latest