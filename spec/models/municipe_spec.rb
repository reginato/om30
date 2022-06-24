# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Municipe, type: :model do
  %i[name cpf cns email birth_date phone].each do |field|
    it { is_expected.to validate_presence_of field }
  end 

  describe "validates" do
    context 'municipe is valid?' do
      let(:municipe) { build :municipe }
      let(:municipe_invalid) { build :municipe, name: nil }
    
      context "valid past date" do
        it { expect(municipe).to be_valid }
      end

      context "invalid future date" do
        it { expect(municipe_invalid).to_not be_valid }
      end
    end
    
    context 'email' do
      let(:municipe) { build :municipe }
      let(:municipe_invalid) { build :municipe, email: 'teste.com' }
    
      context "valid past date" do
        it { expect(municipe).to be_valid }
      end

      context "invalid future date" do
        it { expect(municipe_invalid).to_not be_valid }
      end
    end  

    context 'cpf' do
      let(:municipe) { build :municipe, cpf: '02762206928' }
      let(:municipe_invalid) { build :municipe, cpf: '012345678' }
    
      context "valid past date" do
        it { expect(municipe).to be_valid }
      end

      context "invalid future date" do
        it { expect(municipe_invalid).to_not be_valid }
      end
    end      
  end 
end  