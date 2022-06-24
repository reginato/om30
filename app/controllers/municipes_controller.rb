class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[ show edit update ]

  def index
    @municipes = Municipe.all
  end

  def show
  end

  def new
    @municipe = Municipe.new
  end

  def edit
  end

  def create
    @municipe = Municipe.new(municipe_params)

    puts @municipe.save!
    respond_to do |format|
      if @municipe.save
        MunicipeMailer.municipe_create(@municipe).deliver_now
        format.html { redirect_to municipe_url(@municipe), notice: "Municipe was successfully created." }
        format.json { render :show, status: :created, location: @municipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @municipe.update(municipe_params)
        MunicipeMailer.municipe_update(@municipe).deliver_now
        format.html { redirect_to municipe_url(@municipe), notice: "Municipe was successfully updated." }
        format.json { render :show, status: :ok, location: @municipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def set_municipe
    @municipe = Municipe.find(params[:id])
  end

  def municipe_params
    params.require(:municipe).permit(:name, :cpf, :cns, :email, :birth_date, :phone, :status, :photo_cache, address: [:cep, :street, :complement, :neighborhood, :city, :uf, :ibge_code])
  end
end
