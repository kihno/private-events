class ProfilesController < ApplicationController
  def index
    @profiles = User.all.order(name: :asc)
  end

  def show
    @profile = User.find(params[:id])
  end
end
