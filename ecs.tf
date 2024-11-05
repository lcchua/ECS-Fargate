# Creates a task definition using the files/task-definition.json
# HINT: if you would like to use your own docker image, update the container_definitions image_url
# accordingly

resource "aws_ecs_task_definition" "own_task_definition" {
  family                   = "lcchua-ecs-taskdef" # Update accordingly
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = var.ex_role_arn
  cpu                      = 2048
  memory                   = 4096

  # For custom ECR image
  # container_definitions = templatefile("./files/task-definition.json", {
  #   image_url        = "255945442255.dkr.ecr.us-east-1.amazonaws.com/lcchua-nodejs-app:latest"
  #   container_name   = "lcchua-test-ecs"
  #   port_name        = "lcchua-test-ecs-8080-tcp"
  #   log_group_region = "us-east-1"
  #   log_group_name   = "/ecs/lcchuatesttaskdef"
  #   log_group_prefix = "ecs"
  # })

  # For nginx image
  container_definitions = templatefile("./files/task-definition.json", {
    image_url        = "nginx:latest"
    port_name        = "nginx80-tcp"
    container_name   = "NGINX"
    log_group_region = "us-east-1"
    log_group_name   = "/ecs/lcchua-test-ecs-taskdef"
    log_group_prefix = "ecs"
  })
}

# Creates an ecs clustersctp-ce5-tfstate-bucket-1

resource "aws_ecs_cluster" "own_cluster" {
  name = "lcchua-ecs-test-cluster" # Update accordingly
}

# Creates an ecs service

resource "aws_ecs_service" "own_service" {
  name             = "lcchua-nginx-service" # Update accordingly
  cluster          = aws_ecs_cluster.own_cluster.arn
  task_definition  = aws_ecs_task_definition.own_task_definition.arn
  desired_count    = 2
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs-alb-tg.arn
    container_name   = "NGINX"
    container_port   = 80
  }

  network_configuration {
    subnets          = data.aws_subnets.public_subnets.ids
    assign_public_ip = true
    security_groups  = [var.sg_id]
  }
}