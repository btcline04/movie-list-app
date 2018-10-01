class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
  end

  def update
  end

  def destroy
  end
end
