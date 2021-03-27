class StylistsController < ApplicationController
  def index
    @rooms = Room.all
  end

end
