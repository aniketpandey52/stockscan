class VariablesController < ApplicationController
  def index
  end

  def show
    variable = Variable.where(url: params[:id]).first

    render json: variable 
  end
end
