if Rails.env.development?
  Clientoken.setup do |config|
    config.clientoken_env = ENV.fetch('CLIENTOKEN_ENV')
    config.administoken_master_token = 'aeac9179ad953090d2d98b61a524e9fc'
  end
end
