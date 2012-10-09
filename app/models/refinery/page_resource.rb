module Refinery
  class PageResource < Refinery::Core::BaseModel

    belongs_to :resource
    belongs_to :page, :polymorphic => true

    translates :caption if self.respond_to?(:translates)

    attr_accessible :resource_id, :position, :locale, :caption
    self.translation_class.send :attr_accessible, :locale

  end
end
