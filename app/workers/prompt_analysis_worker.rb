class PromptAnalysisWorker
  include Sidekiq::Worker

  def perform
    Prompt.create(
      body: 'This was created from a sidekiq worker.',
      user_id: 1,
      word_id: 25,
    )
  end
end
