# Creating ECS cluster
resource "aws_ecs_cluster" "example" {
  name = "${var.env}-ecs-cluster"
}
# Creating capacity provider 
#

# Creating cluster capacity provider 
#

# Creating task definition 
resource "aws_ecs_task_definition" "example"{
  family = "${var.env}-tf"
  network_mode = var.network_mode
  cpu = 300
  execution_role_arn = var.execution_role_arn
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
  # container definition in json format 
  container_definitions = jsonencode([
    {
      name      = "my-container"
      image     = "${var.image_name}"
      cpu       = var.cpu_capacity
      memory    = var.memory_capacity
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = 0
          protocol      = "tcp"
        }
      ]
    }
  ])

}

resource "aws_ecs_service" "example" {
  name = "my-ecs-service"
  cluster = aws_ecs_cluster.example.id
  task_definition = aws_ecs_task_definition.example.arn
  desired_count = 2
  force_new_deployment = true

  placement_constraints {
    type = "distinctInstance"
  }

  #

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name = "my-container"
    container_port = var.container_port
  }
  depends_on = [ var.asg_id ]
}
