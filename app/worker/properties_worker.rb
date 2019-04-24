class PropertiesWorker
  include Sidekiq::Worker

  def perform
    c = CacheProperties.new(
        config: OceanoConfig,
        logger: Logger.new(STDOUT),
        redis: RedisClient
    )
    c.perform!
  end
end