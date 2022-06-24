class Municipe < ApplicationRecord
  validates :name, :cpf, :cns, :email, :birth_date, :phone, :status, presence: true
  validate :birth_dates

  def birth_dates
    return if birth_date.blank?

    errors.add(:birth_date, "Can't be in the past!") if birth_date > Time.now
  end
end
