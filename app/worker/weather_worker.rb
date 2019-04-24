class WeatherWorker
  include Sidekiq::Worker

  def perform
    c = CacheForecast.new(
        config: OceanoConfig,
        logger: Logger.new(STDOUT),
        redis: RedisClient
    )
    c.perform!
  end
end