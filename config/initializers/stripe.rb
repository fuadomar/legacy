if(Rails.env == 'development')
  Stripe.api_key = "lbTz9p7vv2Qw3FqCrQkIi8sSME7dLbA3"   #developer's test account
  STRIPE_PUBLIC_KEY = "pk_HiQuX0vPapmGVtVI12DPykj6L2K6h" #developer's test account
#  Stripe.api_key = "VG1wGCdH5WUpnkpeGPk9h1bFMfMkJCBG"     #Client's test account
#  STRIPE_PUBLIC_KEY = "pk_MkI4oYnKhCty48op80kaqy1EHiGZ4"  #Client's test account
elsif(Rails.env == 'production')
  Stripe.api_key = "x4O6zTgUAI0DUho7HPtvRaCYX5LX0WFX"
  STRIPE_PUBLIC_KEY = "pk_TGuqjL4D2oQMiq09LaBGpjF6MR9Hy"
end
