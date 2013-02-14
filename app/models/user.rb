class User < ActiveRecord::Base
  devise :stormpath_authenticatable, :stormpath_recoverable, :stormpath_confirmable, :registerable, :rememberable

end
