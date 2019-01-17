desc "This task is called by the Heroku scheduler add-on"
task :send_reminder => :environment do
  puts "Updating feed..."
  User.all.each do |user|
    if user.phone_number
      user.reminder
    end
  end
  puts "done."
end
