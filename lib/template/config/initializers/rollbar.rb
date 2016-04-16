Rollbar.configure do |config|
  config.enabled = ENV.has_key?('ROLLBAR_ACCESS_TOKEN')
  config.access_token = ENV["ROLLBAR_ACCESS_TOKEN"]
  config.environment = ENV['ROLLBAR_ENV']
  config.use_sucker_punch
end

