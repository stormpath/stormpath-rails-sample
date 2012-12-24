Before do
  Stormpath::Rails::Client.all_accounts.each do |account|
    Stormpath::Rails::Client.ds.delete account
  end
end
