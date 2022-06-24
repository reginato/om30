class Address < ApplicationRecord
  belongs_to :municipe  

  validates :cep, :street, :city, :uf, :neighborhood, presence: true
  validates :cep, correios_cep: true
end
