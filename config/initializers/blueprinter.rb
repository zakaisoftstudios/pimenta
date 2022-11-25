require 'yajl'

Blueprinter.configure do |config|
  config.generator = Yajl::Encoder
  config.method = :encode
end