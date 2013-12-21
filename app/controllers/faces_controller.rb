class FacesController < ApplicationController
  def index
    @faces = Face.all
  end

  def new
  end

  def create
  end

  def destroy
  end
end
