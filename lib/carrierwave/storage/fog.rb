CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAICTK477W47GBGHGQ',                        # required unless using use_iam_profile
    aws_secret_access_key: '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',                        # required unless using use_iam_profile
   # use_iam_profile:       true,                         # optional, defaults to false
    region:                'eu-west-3',                  # optional, defaults to 'us-east-1'
    # host:                  's3.example.com',             # optional, defaults to nil
   # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'library-book'                                      # required
  config.fog_public     = false                                                 # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end