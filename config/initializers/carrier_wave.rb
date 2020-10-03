if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => 'ap-northeast-1',     # 例: 'ap-northeast-1'
      :aws_access_key_id     => 'AKIAS4UR4KG4A3GZQA5R',
      :aws_secret_access_key => 'SHglidQRq7syu77mhaZt+ErZdV6GXnOZL95i1cq3'
    }
    config.fog_directory     =  'bucket-sample002'
  end
end