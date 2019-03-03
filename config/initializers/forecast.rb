# frozen_string_literal: true

ForecastIO.configure do |configuration|
  configuration.api_key = Rails.application.credentials[:forecastio_api_key]
end
