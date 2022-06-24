class Address < ApplicationRecord
  belongs_to :municipe  

  validates :cep, :street, :city, :uf, :neighborhood, presence: true
end
