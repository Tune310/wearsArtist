class ArtsController < ApplicationController
  def index
    @arts = Art.all
  end

  def new
  end

  def show
  end
end
