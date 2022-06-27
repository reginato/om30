require 'sidekiq'
require 'sidekiq/web'

redis_url = ENV.fetch('REDIS_URL', 'redis://localhost:6379/0')
redis_namespace = ENV.fetch('REDIS_NAMESPACE', nil)

Sidekiq.configure_client { |config| config.redis = { url: redis_url, size: 1, namespace: redis_namespace } }
Sidekiq.configure_server { |config| config.redis = { url: redis_url, namespace: redis_namespace } }
