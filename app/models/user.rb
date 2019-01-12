class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :bio, length: { maximum: 200,
                            too_long: "Whoa there! Save your keystrokes for your daily writing. %{count} characters is the maximum allowed here." }

  has_many :prompts
  has_many :freewrites

  has_streak

  def total_word_count
    prompts.map{|p| p.word_count }.sum
  end

  def prompts_and_freewrite_word_count
    prompt_word_count = prompts.map{|p| p.word_count }.sum
    freewrite_word_count = freewrites.map{|f| f.body.split.count }.sum
    prompt_word_count + freewrite_word_count
  end
end
