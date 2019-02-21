class PromptAnalysisWorker
  include Sidekiq::Worker

  # 1 prompt is created in the create action
  # 2 save prompt_id to an ivar
  # 3 then call the worker and pass it parameters to update the prompt (prompt_id and body)
  # 4
  # 5

  def perform(prompt_id)
    require "google/cloud/language"

    prompt = Prompt.find(prompt_id)

    language = Google::Cloud::Language.new project: ENV["GOOGLE_PROJECT_ID"]

    response = language.syntax content: prompt.body, type: :PLAIN_TEXT

    sentences = response.sentences
    tokens    = response.tokens

    nouns = []
    verbs = []
    adverbs = []
    adjectives = []
    articles = []
    prepositions = []
    pronouns = []
    conjunctions = []

    tokens.each do |token|
      if token.part_of_speech.to_s.eql? 'NOUN'
        nouns << token
      end
      if token.part_of_speech.to_s.eql? 'VERB'
        verbs << token
      end
      if token.part_of_speech.to_s.eql? 'ADV'
        adverbs << token
      end
      if token.part_of_speech.to_s.eql? 'ADJ'
        adjectives << token
      end
      if token.part_of_speech.to_s.eql? 'DET'
        articles << token
      end
      if token.part_of_speech.to_s.eql? 'ADP'
        prepositions << token
      end
      if token.part_of_speech.to_s.eql? 'PRON'
        pronouns << token
      end
      if token.part_of_speech.to_s.eql? 'CONJ'
        conjunctions << token
      end
    end

    sentence_count = sentences.count
    noun_count = nouns.count
    verb_count = verbs.count
    adverb_count = adverbs.count
    adjective_count = adjectives.count
    article_count = articles.count
    preposition_count = prepositions.count
    pronoun_count = pronouns.count
    conjunction_count = conjunctions.count


    prompt.update(
      id: prompt.id,
      sentence_count: sentence_count,
      noun_count: noun_count,
      verb_count: verb_count,
      adverb_count: adverb_count,
      adjective_count: adjective_count,
      article_count: article_count,
      preposition_count: preposition_count,
      pronoun_count: pronoun_count,
      conjunction_count: conjunction_count
    )
  end

end
