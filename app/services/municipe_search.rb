# frozen_string_literal: true

class MunicipeSearch
    def initialize(municipe_params)
      @name = municipe_params[:name]
    end 
  
    def search
      if @name.present?
        Municipe.where('name = ?', @name)
      else
        Municipe.all
      end    
    end  
  end    