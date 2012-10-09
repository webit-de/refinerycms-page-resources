class ChangePageToPolymorphicResource < ActiveRecord::Migration
  def change
    add_column :refinery_page_resources, :page_type, :string, :default => "page"
  end
end
