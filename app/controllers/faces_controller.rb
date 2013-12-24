class FacesController < ApplicationController
  def index
    @faces = Face.all

    respond_to do |format|
      format.json { render json: @faces }
    end
  end

  def show
    @face = Face.find params[:id]

    respond_to do |format|
      format.json { render json: @face }
    end
  end

  def create
    @face = Face.new params[:face]

    if @face.save
      redirect_to '/'
    else
      redirect_to '/', notice: "you did it wrong"
    end
  end
end
