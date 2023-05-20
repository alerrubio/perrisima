Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://ec2-52-20-96-39.compute-1.amazonaws.com:3000', 'localhost:3000'
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end