if(Rails.env == 'development')
  Stripe.api_key = "lbTz9p7vv2Qw3FqCrQkIi8sSME7dLbA3"
  STRIPE_PUBLIC_KEY = "pk_HiQuX0vPapmGVtVI12DPykj6L2K6h"
elsif(Rails.env == 'production')
  Stripe.api_key = "lbTz9p7vv2Qw3FqCrQkIi8sSME7dLbA3"
  STRIPE_PUBLIC_KEY = "pk_HiQuX0vPapmGVtVI12DPykj6L2K6h"
end
