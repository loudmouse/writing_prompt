desc 'This task is called by the Heroku scheduler add-on'
task send_reminder: :environment do
  puts 'Updating feed...'
  # only send to users that have opted in to sms_alerts
  User.where(sms_alerts: true).each do |user|
    user.reminder
  end
  puts 'done.'
end
