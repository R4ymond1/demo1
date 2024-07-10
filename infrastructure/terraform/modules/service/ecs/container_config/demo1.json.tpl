[
  {
    "name": "${resource_prefix}-demo1-container-config",
    "image": "${image_url}",
    "cpu": ${cpu},
    "memory": ${memory},
    "essential": true,
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "${log_group}",
          "awslogs-region": "${aws_region}",
          "awslogs-stream-prefix": "ecs"
        }
    },
    "portMappings": [
      {
        "containerPort": ${service_port}
      }
    ],
    "environment": [
      {
        "name": "REGION",
        "value": "${aws_region}"
      }
    ]
  }
]