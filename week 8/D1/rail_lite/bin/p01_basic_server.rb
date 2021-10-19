require 'rack'
app = Proc.new do |env|
  request = Rack::Request.new(env)
  response = Rack::Response.new
  response['Content-Type'] = 'text/html'
  response.write(request.path)
  response.finish
  # ['200', {'Content-Type' => 'text/html'}, ['hello world']]
end

Rack::Server.start(
  app: app,
  Port: 3000
)