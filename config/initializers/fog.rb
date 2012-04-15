CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAI3KKG52XO5SFVHKQ',       # required
    :aws_secret_access_key  => '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'   # required
  }
  config.fog_directory  = 'mylegacyplan-storage'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end