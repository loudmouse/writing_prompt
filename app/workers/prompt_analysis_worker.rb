class PromptAnalysisWorker
  include Sidekiq::Worker

  def perform
    require "google/cloud/language"

    language = Google::Cloud::Language.new

    text_content = "Hello babies. Welcome to Earth. It's hot in the summer and cold in the winter. It's round and wet and crowded. On the outside, babies, you've got a hundred years here. There's only one rule that I know of, babies-God damn it, you've got to be kind."

    response = language.syntax content: text_content, type: :PLAIN_TEXT

    sentences = response.sentences
    tokens    = response.tokens

    # puts "Tokens: #{tokens.count}"

    nouns = []
    articles = []
    prepositions = []
    verbs = []
    adverbs = []
    adjectives = []
    pronouns = []
    conjunctions = []

    tokens.each do |token|
      if token.part_of_speech.to_s.eql? 'NOUN'
        nouns << token
      end
      # if token.part_of_speech.tag.to_s.eql? 'DET'
      #   articles << token
      # end
      # if token.part_of_speech.tag.to_s.eql? 'ADP'
      #   prepositions << token
      # end
      if token.part_of_speech.to_s.eql? 'VERB'
        verbs << token
      end
      if token.part_of_speech.to_s.eql? 'ADV'
        adverbs << token
      end
      if token.part_of_speech.to_s.eql? 'ADJ'
        adjectives << token
      end
      # if token.part_of_speech.tag.to_s.eql? 'PRON'
      #   pronouns << token
      # end
      # if token.part_of_speech.tag.to_s.eql? 'CONJ'
      #   conjunctions << token
      # end
      # puts "#{token.part_of_speech.tag} #{token.text.content}"
    end

    noun_count = nouns.count
    article_count = articles.count
    preposition_count = prepositions.count
    verb_count = verbs.count
    adverb_count = adverbs.count
    adjective_count = adjectives.count
    pronoun_count = pronouns.count
    conjunction_count = conjunctions.count

    # puts "Your passage has #{sentences.count} sentences"
    # puts "Your passage has #{noun_count} nouns."
    # puts "Your passage has #{article_count} articles."
    # puts "Your passage has #{preposition_count} prepositions."
    # puts "Your passage has #{verb_count} verbs."
    # puts "Your passage has #{adverb_count} adverbs."
    # puts "Your passage has #{adjective_count} adjectives."
    # puts "Your passage has #{pronoun_count} pronouns."
    # puts "Your passage has #{conjunction_count} conjunctions."



    Prompt.create(
      body: "Your passage has #{sentences.count} sentences, #{noun_count} nouns, #{verb_count} verbs, #{adverb_count} adverbs, #{adjective_count} adjectives.",
      user_id: 1,
      word_id: 25,
    )
  end

end
