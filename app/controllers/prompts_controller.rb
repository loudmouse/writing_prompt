class PromptsController < ApplicationController
  def index
    @prompts = Prompt.all
  end

  def new
    @prompt = Prompt.new
  end

  def create

  end
end
