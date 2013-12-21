class FacesController < ApplicationController
  def index
    @faces = Face.all
  end

  def new
  end

  def create
    @face = Face.new params[:face]

    if @face.save
      redirect_to '/'
    else
      redirect_to '/', notice: "you did it wrong"
    end
  end

  def destroy
  end
end
