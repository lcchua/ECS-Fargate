# Module 3.11 assignment - ECS Fargate simple creation


### Activity
To create a simple ECS Fargate service using the latest NGINX image.

## Steps taken to create an ECS Fargate resource:

### ECS Task Definition
Firstly, we defined the ECS task by using the Terraform resource aws_ecs_task_definition, naming as "lcchua-ecs-taskdef", and with the following definitions:
1. name of task definition
2. requires_compatibilities = "FARGATE"
3. network_mode = "awsvpc"
4. the IAM execution_role_arn
5. the number fo CPU units where 1 vCPU allocated == '1024' units
6. the amount of allocated memory in MB

### ECS Cluster
Next the ECS cluster was created by using the Terraform resource aws_ecs_cluster named "lcchua-ecs-test-cluster".

### ECS Service
Lastly we created the ECS service using the Terraform resource ws_ecs_service, naming as "lcchua-nginx-service", and with the following configurations:
1. network_configuration
2. deployment_circuit_breaker
3. launch_type = "FARGATE"
4. name of service
5. cluster previously created
6. task definition previously created
7. desired count that you wish

### End Goal
Once everything has been successfully created, we will be able to access the ECS endpoint under Service > Tasks from the console, which should look like this:
![Screenshot 2024-11-05 at 9 11 46 AM](https://github.com/user-attachments/assets/30b97731-a975-4554-9fdb-35f3e4e189ae)

![Screenshot 2024-11-05 at 9 10 45 AM](https://github.com/user-attachments/assets/426880df-90d7-4c96-9442-a23b93e9a3a4)


### Clean Up
To tear down your infrastructure using Terraform destroy, we do so in the following order:
1. Service
2. ECS Cluster
3. Task Definition
