resource "aws_api_gateway_resource" "streams" {
  count       = var.create_api_gateway
  rest_api_id = aws_api_gateway_rest_api.mod[0].id
  parent_id   = aws_api_gateway_rest_api.mod[0].root_resource_id
  path_part   = "streams"
}

resource "aws_api_gateway_method" "list_streams" {
  count            = var.create_api_gateway
  rest_api_id      = aws_api_gateway_rest_api.mod[0].id
  resource_id      = aws_api_gateway_resource.streams[0].id
  http_method      = "GET"
  authorization    = "NONE"
  api_key_required = true
}

resource "aws_api_gateway_integration" "list_streams" {
  count                   = var.create_api_gateway
  rest_api_id             = aws_api_gateway_rest_api.mod[0].id
  resource_id             = aws_api_gateway_resource.streams[0].id
  http_method             = aws_api_gateway_method.list_streams[0].http_method
  type                    = "AWS"
  integration_http_method = "POST"
  uri                     = "arn:aws:apigateway:${var.aws-region}:kinesis:action/ListStreams"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  credentials             = aws_iam_role.gateway_execution_role[0].arn

  request_parameters = {
    "integration.request.header.Content-Type" = "'application/x-amz-json-1.1'"
  }
  
    request_templates = {
    "application/json" = 

  }
}
resource "aws_api_gateway_method_response" "list_streams_ok" {
  count       = var.create_api_gateway
  depends_on  = [aws_api_gateway_method.list_streams]
  rest_api_id = aws_api_gateway_rest_api.mod[0].id
  resource_id = aws_api_gateway_resource.streams[0].id
  http_method = aws_api_gateway_method.list_streams[0].http_method
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "list_streams_ok" {
  count       = var.create_api_gateway
  rest_api_id = aws_api_gateway_rest_api.mod[0].id
  resource_id = aws_api_gateway_resource.streams[0].id
  http_method = aws_api_gateway_method.list_streams[0].http_method
  status_code = aws_api_gateway_method_response.list_streams_ok[0].status_code

  
  response_templates = {
    "application/json" = 

  }
}

