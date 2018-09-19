class PromptsController < ApplicationController
  require 'oxford_dictionary'

  def index
    @prompts = Prompt.all
  end

  def new
    @prompt = Prompt.new

    client = OxfordDictionary::Client.new(app_id: Figaro.env.app_id, app_key: Figaro.env.app_key)
    client = OxfordDictionary.new(app_id: Figaro.env.app_id, app_key: Figaro.env.app_key)


    # word = client.entry("car")

    # creates a list of 10 nouns
    word_list = client.wordlist(lexicalCategory: 'Noun', limit: '20', regions: 'US')
    # generates random number from the list, minus 1 to 0-index it
    word_index = rand(5)-1
    @random_word = word_list.results[word_index].word

    # @definition = @random_word.lexical_entries[0].entries[0].senses[0].definitions[0]

    # @example = word.lexical_entries[0].entries[0].senses[0].examples[0].text
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
    params.require(:prompt).permit(:random_word, :body)
  end
end
