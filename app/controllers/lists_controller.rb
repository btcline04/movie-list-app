class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      flash[:danger] = "Please try again."
      redirect_to new_list_path
    end
  end

  def show
    @list.movies.order_list(params[:sort_by])
  end

  def edit
  end

  def update
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :sort_by)
  end

end
