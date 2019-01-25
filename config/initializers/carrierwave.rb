require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'upload-image-for-chat-space'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/upload-image-for-chat-space'
  config.fog_public = true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
