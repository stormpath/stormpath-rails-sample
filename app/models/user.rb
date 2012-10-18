class User < ActiveRecord::Base
  include Stormpath::Rails::Account

  # need stormpath_url field to work
end
