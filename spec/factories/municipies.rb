# frozen_string_literal: true

FactoryBot.define do
  factory :municipe, class: Municipe do
    name { 'Rodrigo' }
    cpf { '02762206928'}
    cns { '1234567' }
    email { 'rreginatom@gmail.com' }
    birth_date { '1979-03-27' }
    phone { '5543991516103' }
    status { 'pending' }
  end
end
    