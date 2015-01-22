module Refinery
  class PageResource < Refinery::Core::BaseModel

    belongs_to :resource
    belongs_to :page, :polymorphic => true

    translates :caption
  end
end
