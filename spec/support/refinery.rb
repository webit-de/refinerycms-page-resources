require 'refinerycms-testing'

RSpec.configure do |config|
  config.extend Refinery::Testing::ControllerMacros::Authentication, :type => :controller
  config.extend Refinery::Testing::FeatureMacros::Authentication, :type => :feature
end
