require "stripe"

module StripeClerk
  class Engine < ::Rails::Engine
    isolate_namespace StripeClerk

    config.assets.precompile += %w( your_stripe_logo.png )

    config.active_record.raise_in_transactional_callbacks = true
  end
end
