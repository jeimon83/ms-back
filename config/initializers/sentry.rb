if Rails.env.production?
  Sentry.init do |config|
    config.dsn = 'https://1edeef06b9cb1cd9eb768cbe95842b97@o4506068449492992.ingest.sentry.io/4506068450541568'
    config.breadcrumbs_logger = %i[active_support_logger http_logger]

    # Set traces_sample_rate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production.
    config.traces_sample_rate = 1.0
    # or
    config.traces_sampler = lambda do |_context|
      true
    end
  end
end
