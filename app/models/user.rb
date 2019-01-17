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

  # after_create :reminder

  has_streak

  def total_word_count
    prompts.map{|p| p.word_count }.sum
  end

  def prompts_and_freewrite_word_count
    prompt_word_count = prompts.map{|p| p.word_count }.sum
    freewrite_word_count = freewrites.map{|f| f.body.split.count }.sum
    prompt_word_count + freewrite_word_count
  end

  def reminder
    if self.phone_number && self.sms_alerts #only send to users with a phone number AND have opted in to sms_alerts
      @twilio_number = ENV['TWILIO_NUMBER']
      account_sid = ENV['TWILIO_ACCOUNT_SID']
      auth_token = ENV['TWILIO_AUTH_TOKEN']

      @client = Twilio::REST::Client.new account_sid, auth_token
      reminder = "Hi, #{self.username}, it's time to write. Today's word is '#{Word.for_today.first.word}'. Write now: https://quiet-sea-41663.herokuapp.com/write"
      message = @client.api.account.messages.create(
        from: @twilio_number,
        to: '+1' + self.phone_number,
        body: reminder
      )
    end
  end

  # def when_to_run
  #   now = Time.now - 6.hours
  #   one_minute_from_now = now + 1.minutes
  # end
  #
  # handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }

end
