class PromptsController < ApplicationController
  def index
    @prompts = Prompt.all
  end

  def new
    @prompt = Prompt.new
  end

  def create
    @prompt = Prompt.new(prompt_params)

    if @prompt.save
      flash[:notice] = "Your prompt has been saved."
      redirect_to prompts_url
    else
      render :new
    end
  end

  private

  def prompt_params
    params.require(:prompt).permit(:random_word, :body)
  end
end
