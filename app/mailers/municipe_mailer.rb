class MunicipeMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def municipe_create(municipe)
    @municipe = municipe
    mail(to: @municipe.email, subject: 'Created with Success')
  end

  def municipe_update(municipe)
    @municipe = municipe
    mail(to: @municipe.email, subject: 'Updated with Success')
  end
end
