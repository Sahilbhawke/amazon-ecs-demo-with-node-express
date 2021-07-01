resource "aws_ecs_cluster" "node-calc-cluster" {
  name = var.cluster_name
  tags = {
    "env"          = "deployment/production"
    "project_name" = "node-calc-app"
    "createdBy"    = "bitcot-dev"
  }
}

resource "aws_ecs_task_definition" "node-calc-task" {
  family                = "web-family"
  container_definitions = file("container-definitions/container-def.json")
  network_mode          = "bridge"
  tags = {
    "env"          = "deployment/production"
    "project_name" = "node-calc-app"
    "createdBy"    = "bitcot-dev"
  }
}

resource "aws_ecs_service" "service" {
  name            = "node-calc-service"
  cluster         = aws_ecs_cluster.node-calc-cluster.id
  task_definition = aws_ecs_task_definition.node-calc-task.arn
  desired_count   = 1
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.lb_target_group.arn
    container_name   = "node-calc-app"
    container_port   = 80
  }
  lifecycle {
    ignore_changes = [
      desired_count
    ]
  }
  launch_type = "EC2"
  depends_on = [
    aws_lb_listener.web-listener
  ]
}

resource "aws_cloudwatch_log_group" "log_group" {
  name = "/ecs/node-frontend"
  tags = {
    "env"          = "deployment/production"
    "project_name" = "node-calc-app"
    "createdBy"    = "bitcot-dev"
  }
}