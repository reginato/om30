Twilio.configure do |config|
  config.account_sid = YAML.safe_load(File.open(Rails.root.join('config/creds.yml')))['twillio']['twilio_account_sid']
  config.auth_token = YAML.safe_load(File.open(Rails.root.join('config/creds.yml')))['twillio']['auth_token']
end