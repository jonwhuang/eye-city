namespace :report do
  desc "send monthly report"
  task monthly_update: :environment do
    puts "Sending monthly report to email"
    AdminMailer.monthly_update.deliver
  end
end
