class Municipe < ApplicationRecord
  has_one :address

  validates :name, :cpf, :cns, :email, :birth_date, :phone, :status, presence: true
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validate :birth_dates
  validates_cpf_format_of :cpf

  mount_uploader :photo, PhotoUploader

  def birth_dates
    return if birth_date.blank?

    errors.add(:birth_date, "Can't be in the past!") if birth_date > Time.now
  end
end
