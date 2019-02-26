require "google/cloud/language"

class PromptAnalysisWorker
  include Sidekiq::Worker

  # 1 prompt is created in the create action
  # 2 save prompt_id to an ivar
  # 3 then call the worker and pass it parameters to update the prompt (prompt_id and body)
  # 4
  # 5

  def perform(prompt_id)
    prompt = Prompt.find(prompt_id)
    language_connection = Google::Cloud::Language.new project: ENV["GOOGLE_PROJECT_ID"]

    # analyze syntax and update prompt with technical stuff
    prompt.update(get_technical_counts(language_connection, prompt.body))

    # analyze sentiment and update prompt with gooey stuff + do messaging or whatever
  end

  def get_technical_counts(language, body)
    response = language.syntax content: body, type: :PLAIN_TEXT
    counts = {
      noun_count: 0,
      verb_count: 0,
      adverb_count: 0,
      adjective_count: 0,
      article_count: 0,
      preposition_count: 0,
      pronoun_count: 0,
      conjunction_count: 0,
      sentence_count: response.sentences.count
    }

    response.tokens.each do |token|
      count_key = token.part_of_speech.downcase.to_sym
      next unless parts_of_speech_hash.keys.include?(count_key)

      counts[parts_of_speech_hash[count_key]] += 1
    end

    counts
  end

  def parts_of_speech_hash
    {
      noun: :noun_count,
      verb: :verb_count,
      adv: :adverb_count,
      adj: :adjective_count
    }
    #
    # if token.part_of_speech.to_s.eql? 'ADV'
    #   adverbs << token
    # end
    # if token.part_of_speech.to_s.eql? 'ADJ'
    #   adjectives << token
    # end
    # if token.part_of_speech.to_s.eql? 'DET'
    #   articles << token
    # end
    # if token.part_of_speech.to_s.eql? 'ADP'
    #   prepositions << token
    # end
    # if token.part_of_speech.to_s.eql? 'PRON'
    #   pronouns << token
    # end
    # if token.part_of_speech.to_s.eql? 'CONJ'
    #   conjunctions << token
    # end

  end


end
