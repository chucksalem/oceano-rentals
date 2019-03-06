# frozen_string_literal: true

Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w[modernizr.js]
Rails.application.config.assets.precompile += %w[moment.js]
Rails.application.config.assets.precompile += %w[pikaday.jquery.js]
Rails.application.config.assets.precompile += %w[pikaday.js]
Rails.application.config.assets.precompile += %w[jquery.fancybox.pack.js]
Rails.application.config.assets.precompile += %w[jquery.fancybox-media.js]
Rails.application.config.assets.precompile += %w[admin/dashboard.js]

%w[home pages properties accomodations reviews].each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js"]
end
