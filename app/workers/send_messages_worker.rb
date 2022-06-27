
module Workers
  class SendMessagesWorker
  include Sidekiq::Worker

  sidekiq_options retry: 0, queue: 'send_mail_and_sms'

  def perform(municipe_id)
    municipe = Municipe.find(municipe_id)
    return if municipe.blank?

    SendSMS.new('Criado com sucesso', municipe.phone_number).call
    MunicipeMailer.municipe_create(municipe).deliver_now
  end
end
  