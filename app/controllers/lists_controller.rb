class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy, :list_data]

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
  end

  def edit
  end

  def update
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  def list_data
    @movies = @list.movies
    render json: @movies, status: 201
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
