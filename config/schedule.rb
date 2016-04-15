set :environment, 'development'

every 1.minute do
  command "bundle"
  rake "report:monthly_update"
end
