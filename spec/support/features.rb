RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
  config.include Features::DebugHelpers, type: :feature
end
