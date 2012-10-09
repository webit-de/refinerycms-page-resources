class AddCaptionToPageResources < ActiveRecord::Migration
  def change
    add_column :refinery_page_resources, :caption, :text
  end
end
