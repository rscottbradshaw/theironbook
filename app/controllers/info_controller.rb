class InfoController < ApplicationController
  def create
    @info = Info.params
  end

  def show
  end

  def destroy
  end
end
