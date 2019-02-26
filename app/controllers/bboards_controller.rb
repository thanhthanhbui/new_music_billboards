class BboardsController < ApplicationController
  before_action :set_bboard, only: [:show, :update, :edit, :destroy]

  def index
    @bboards = current_user.bboards
  end

  def show
    @songs = @bboard.songs
  end

  def new
    @bboard = Bboard.new
  end

  def create
    @bboard = current_user.bboards.new(bboard_params)

    if @bboard.save
      flash[:success] = "Account Created"
      redirect_to bboards_path
    else
      flash[:error] = "Error #{@account.errors.full_messages.join("\n")}"
      render :new
    end
  end

  def edit
  end

  def update
    if @bboard.update(bboard_params)
      redirect_to @bboard
    else
      render :edit
    end
  end

  def destroy
    @bboard.destroy
    redirect_to bboards_path
  end

  private

  def set_bboard
    @bboard = current_user.bboards.find(params[:id])
  end

  def bboard_params
    params.require(:bboard).permit(:title, :genre)
  end

end
