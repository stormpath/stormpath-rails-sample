require 'vcr'

VCR.configure do |c|
  c.hook_into :fakeweb
  c.cassette_library_dir     = 'features/cassettes'
  c.default_cassette_options = { :record => :new_episodes }
end

VCR.cucumber_tags do |t|
  t.tag  '@stormpath'
end