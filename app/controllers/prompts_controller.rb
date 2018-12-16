class PromptsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
      redirect_to prompts_url
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
    @random_word = @prompt.word.word
    @body = @prompt.body
    @word_count = @prompt.word_count
    @def = @prompt.word.definition[0]
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
    params.require(:prompt).permit(:random_word, :body, :word_id)
  end
end
