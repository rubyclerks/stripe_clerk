module StripeClerk
  class Engine < ::Rails::Engine
    isolate_namespace StripeClerk

    config.assets.precompile += %w( your_stripe_logo.png )

  end
end
