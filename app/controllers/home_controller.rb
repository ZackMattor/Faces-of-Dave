class HomeController < ApplicationController
  def index
    @faces = Face.all   
    @newFace = Face.new
  end
end
