Clientoken.setup do |config|
  config.administoken_master_token = 'aeac9179ad953090d2d98b61a524e9fc' if Rails.env.development?
end
