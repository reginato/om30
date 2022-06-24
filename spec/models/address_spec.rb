require 'rails_helper'

RSpec.describe Address, type: :model do
  %i[cep street city uf neighborhood].each do |field|
    it { is_expected.to validate_presence_of field }
  end 
end
