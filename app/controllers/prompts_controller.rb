class PromptsController < ApplicationController
  require 'oxford_dictionary'

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

  def show
    @prompt = Prompt.find(params[:id])



    client = OxfordDictionary::Client.new(app_id: Figaro.env.app_id, app_key: Figaro.env.app_key)
    client = OxfordDictionary.new(app_id: Figaro.env.app_id, app_key: Figaro.env.app_key)


    word = client.entry("banana")
    @random_word = word
    @definition = word.lexical_entries[0].entries[0].senses[0].definitions[0]
    @example = word.lexical_entries[0].entries[0].senses[0].examples[0].text



  end

  private

  def prompt_params
    params.require(:prompt).permit(:random_word, :body)
  end
end
