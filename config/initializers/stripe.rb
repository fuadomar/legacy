if(Rails.env == 'development')
  Stripe.api_key = "lbTz9p7vv2Qw3FqCrQkIi8sSME7dLbA3"
  STRIPE_PUBLIC_KEY = "pk_HiQuX0vPapmGVtVI12DPykj6L2K6h"
elsif(Rails.env == 'production')
  Stripe.api_key = "VG1wGCdH5WUpnkpeGPk9h1bFMfMkJCBG"
  STRIPE_PUBLIC_KEY = "pk_MkI4oYnKhCty48op80kaqy1EHiGZ4"
end
