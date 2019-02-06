desc "This task is called by the Heroku scheduler add-on"
task :send_reminder => :environment do
  puts "Updating feed..."
  User.where(sms_alerts: true).each do |user| #only send to users that have opted in to sms_alerts
      user.reminder
  end
  puts "done."
end
