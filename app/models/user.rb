class User < ActiveRecord::Base
  include Stormpath::Rails::Account

  devise :stormpath_authenticatable, :stormpath_recoverable, :stormpath_confirmable, :registerable

end
