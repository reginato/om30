class SendSMS
  PHONE_NUMBER: YAML.safe_load(File.open(Rails.root.join('config/creds.yml')))['twillio']['phone_number'].freeze
  attr_reader :message, :number
​
  def initialize(message, number)
    @message = message
    @number = number
  end
​
  def call
    client = Twilio::REST::Client.new
    client.messages.create({
    from: PHONE_NUMBER,
      to: @number,
      body: @message
    })
  end
end