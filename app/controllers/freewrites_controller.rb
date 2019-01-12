class FreewritesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :not_your_freewrite, only: [:edit, :update]

  def index
    @freewrites = Freewrite.all
  end

  def new
    @freewrite = Freewrite.new(user: current_user)
  end

  def create
    @freewrite = current_user.freewrites.new(freewrite_params)
    if @freewrite.save
      flash[:notice] = "Your free writing has been saved."
      redirect_to @freewrite
    else
      render :new
    end
  end

  def show
    @freewrite = Freewrite.find(params[:id])
  end

  def edit
    @freewrite = Freewrite.find(params[:id])
  end

  def update
      @freewrite = Freewrite.find(params[:id])
    if @freewrite.update_attributes(freewrite_params)
      redirect_to @freewrite
    else
      render 'edit'
    end
  end

  def destroy
    @freewrite = Freewrite.find(params[:id])
    if current_user == @freewrite.user
        @freewrite.destroy
    end
    redirect_to root_path
  end

  private

  def freewrite_params
    params.require(:freewrite).permit(:body)
  end

  def not_your_freewrite
    @freewrite = Freewrite.find(params[:id])
    redirect_to root_path, notice: "This is not yours to edit." unless current_user == @freewrite.user
  end

end
