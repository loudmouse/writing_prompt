class PromptsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @prompts = Prompt.all
  end

  def new
    # look up ActiveRecord scopes to see how to make a "for_today" scope on the model


    # word = Word.for_today #use for_today as a scope
    word = Word.all.sample
    @prompt = Prompt.new(word: word, user: current_user)
    @def, @type = word.definition
    # syn = Wordnik.word.get_related(@word, :type => 'synonym')
    # @synonyms = syn[0]["words"]
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

  def show
    @prompt = Prompt.find(params[:id])
    @random_word = @prompt.random_word
    @body = @prompt.body
    @word_count = @body.split.size




    # client = OxfordDictionary::Client.new(app_id: Figaro.env.app_id, app_key: Figaro.env.app_key)
    # client = OxfordDictionary.new(app_id: Figaro.env.app_id, app_key: Figaro.env.app_key)
    #
    #
    # word = client.entry("banana")
    # @random_word = word
    # @definition = word.lexical_entries[0].entries[0].senses[0].definitions[0]
    # @example = word.lexical_entries[0].entries[0].senses[0].examples[0].text
  end

  private

  def prompt_params
    params.require(:prompt).permit(:random_word, :body, :word_id)
  end
end
