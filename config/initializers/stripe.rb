if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_AlyjM3xGbby8Qvdd4KCryO7H',
    :secret_key => 'sk_test_A1RzuKKUmKLq8gSiQmtk9Ktb'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]