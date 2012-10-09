module Refinery
  module PageResources
    include ActiveSupport::Configurable

    config_accessor :captions

    self.captions = true
  end
end
