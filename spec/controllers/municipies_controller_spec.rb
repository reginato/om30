# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MunicipesController, type: :controller do
  describe 'GET #index' do
    context 'when params is right' do
     let(:municipe) { create(:municipe) }  
     let(:municipe_2) { create(:municipe, name: 'Rodrigo Reginato') }  

      it 'return all municipies'do
        get :index

        expect(response).to have_http_status(:ok)
        expect(response).to render_template("index")
        expect(assigns(:municipes)).to eq([municipe, municipe_2])
      end

      it 'return one municipe with name'do
        get :index, params: { q: { name_or_cpf_or_cns_or_phone_or_addresses_street_or_addresses_city_or_addresses_ibge_code_or_addresses_neighborhood_or_addresses_complement_cont: "Rodrigo" } }

        expect(response).to have_http_status(:ok)
        expect(response).to render_template("index")
        expect(assigns(:municipes)).to eq([municipe_2])
      end
    end
  end 

  describe 'GET #show' do
    context 'when municipe is found' do
      let(:municipe) { create(:municipe) }

      it 'response data with right receivable' do
        get :show, params: { id: municipe.id }

        expect(response).to have_http_status(:ok)
        expect(response).to render_template('show')
        expect(assigns(:municipe)).to eq(municipe)
      end
    end

    context 'when municipe is not found' do
      it do
        expect {
          get :show, params: { id: 9999 }
        }.to raise_error(ActiveRecord::RecordNotFound)
      end  
    end
  end

  describe "POST create" do
    let(:municipe) { create(:municipe) }

    context "with valid attributes" do

        before { post :create, params: { name: 'Rodrigo', cpf: '02762206928', cns:'1234567', email: 'rreginatom@gmail.com', birth_date: '1979-03-27', phone: '5543991516103', 
                                         addresses_attributes: { id: '1', cep: '86073660', street: 'rua star wars', neighborhood: 'obi wan', complement: 'home', city: 'Londrina', uf: 'PR', ibge_code: '1234' } } }
  
        it { expect(assigns(:municipe)).to be_persisted }
        it { expect(response).to redirect_to municipes_path }
        it { expect(assigns(:municipe)).to eq municipe }
  
      # it "creates a new municipe" do
      #   expect{
      #     post :create, params: { name: 'Rodrigo', cpf: '02762206928', cns:'1234567', email: 'rreginatom@gmail.com', birth_date: '1979-03-27', phone: '5543991516103', 
      #                             addresses_attributes: { id: '1', cep: '86073660', street: 'rua star wars', neighborhood: 'obi wan', complement: 'home', city: 'Londrina', uf: 'PR', ibge_code: '1234' } }
      #   }.to change(Municipe, :count).by(1)
      # end

      # it "don't create a new municipe because out of work hour" do
      #   expect{
      #     post :create, params: { room_id: room.id, user_id: user.id, scheduled_at: "2022-07-21, 5:00 am" }
      #   }.to change(Municipe, :count).by(0)
      # end      
    end
  end  

  describe "PUT update" do
    let(:municipe) { create(:municipe) }
     
    context 'with a valid attributes' do
      it 'update a municipe' do
        put :update, params: { name: 'Theo', cpf: '02762206928', cns:'1234567', email: 'rreginatom@gmail.com', birth_date: '1979-03-27', phone: '5543991516103', addresses_attributes: { cep: '86073660' } }

        expect(municipe.reload.name).to eq("Theo")
      end  

      # it 'dont update a schedule' do
      #   put :update, params: { id: municipe.id, scheduled_at: nil }

      #   expect(municipe.reload.scheduled_at).to eq("2022-07-21 9:00:00 am")
      # end  
    end  
  end  
end  