CarrierWave.configure do |config|
  config.storage = :fog

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['S3_ACCESS'],
    :aws_secret_access_key  => ENV['S3_SECRET'],
  }
  config.fog_directory  = 'assets.facesofdave.org'
end
