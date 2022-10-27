resource "aws_appmesh_gateway_route" "example" {
  name                 = var.example_name
  mesh_name            = var.example_mesh_name
  virtual_gateway_name = aws_appmesh_virtual_gateway.example.name

  spec {
    http_route {
      action {
        target {
          virtual_service {
            virtual_service_name = aws_appmesh_virtual_service.service1.name
          }
        }
      }

      match {
        prefix = "/"
      }
    }
  }

  tags = {
    Environment = "test"
  }
}

resource "aws_appmesh_mesh" "simple" {
  name = var.simple_name

  spec {
    egress_filter {
      type = "ALLOW_ALL"
    }
  }
}


resource "aws_appmesh_virtual_service" "service1" {
  name      = var.service1_name
  mesh_name = aws_appmesh_mesh.simple.id

  spec {
    provider {
      virtual_node {
        virtual_node_name = aws_appmesh_virtual_node.serviceb1.name
      }
    }
  }
}

resource "aws_appmesh_virtual_service" "servicea" {
  name      = var.servicea_name
  mesh_name = aws_appmesh_mesh.simple.id

  spec {
    provider {
      virtual_router {
        virtual_router_name = aws_appmesh_virtual_router.serviceb.name
      }
    }
  }
}

resource "aws_appmesh_virtual_router" "serviceb" {
  name      = var.serviceb_name
  mesh_name = aws_appmesh_mesh.simple.id

  spec {
    listener {
      port_mapping {
        port     = var.port
        protocol = var.protocol
      }
    }
  }
}




resource "aws_appmesh_virtual_gateway" "example" {
  name  = var.virtual_gateway_name
  mesh_name = aws_appmesh_mesh.simple.name

  spec {
    listener {
      port_mapping {
        port     = var.port_mapping_port
        protocol = var.port_mapping_protocol
      }
    }
  }

  tags = {
    Environment = "test"
  }
}

resource "aws_service_discovery_http_namespace" "example" {
  name = var.http_namespace_name
}

resource "aws_appmesh_virtual_node" "serviceb1" {
  name      = var.serviceb1_name
  mesh_name = aws_appmesh_mesh.simple.id

  spec {
    backend {
      virtual_service {
        virtual_service_name = "servicea.simpleapp.local"
      }
    }

    listener {
      port_mapping {
        port     = var.map_port
        protocol = var.map_protocol
      }
    
      health_check {
        protocol            = var.health_check_protocol
        path                = var.health_check_path
        healthy_threshold   = var.healthy_threshold
        unhealthy_threshold = var.unhealthy_threshold
        timeout_millis      = var.timeout_millis
        interval_millis     = var.interval_millis
    }
  }  

    service_discovery {
      aws_cloud_map {
        attributes = {
          stack = "blue"
        }

        service_name   = "serviceb1"
        namespace_name = aws_service_discovery_http_namespace.example.name
      }
    }
  }
}



