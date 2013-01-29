class User < ActiveRecord::Base
  include Stormpath::Rails::Account

  devise :stormpath_authenticatable, :stormpath_recoverable

  # need stormpath_url field to work
end
