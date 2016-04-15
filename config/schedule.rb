set :environment, 'development'

every '0 0 1 * *' do
  command "bundle"
  rake "report:monthly_update"
end
