class PromptsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :not_your_prompt, only: [:edit, :update]

  def index
    @prompts = Prompt.all
  end

  def new
    # look up ActiveRecord scopes to see how to make a "for_today" scope on the model
    word = Word.for_today.first #use for_today as a scope
    # word = Word.all.sample
    @prompt = Prompt.new(word: word, user: current_user)
    @def, @type = word.definition
  end

  def create
    @prompt = current_user.prompts.new(prompt_params)
    if @prompt.save
      flash[:notice] = "Your prompt has been saved."
      redirect_to @prompt
    else
      render :new
    end
  end

  def edit
    @prompt = Prompt.find(params[:id])
  end

  def update
    @prompt = Prompt.find(params[:id])
    if @prompt.update_attributes(prompt_params)
      redirect_to @prompt
    else
      render 'edit'
    end
  end

  def show
    @prompt = Prompt.find(params[:id])
    if @prompt.free?
      render 'show_freewrite'
    else
      render 'show'
    end
  end

  def destroy
    @prompt = Prompt.find(params[:id])
    if current_user == @prompt.user
        @prompt.destroy
    end
    redirect_to root_path
  end

  private

  def prompt_params
    params.require(:prompt).permit(:body, :word_id)
  end

  def not_your_prompt
    @prompt = Prompt.find(params[:id])
    redirect_to root_path, notice: "This is not yours to edit." unless current_user == @prompt.user
  end
end
