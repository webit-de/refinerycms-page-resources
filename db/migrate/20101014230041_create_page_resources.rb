class CreatePageResources < ActiveRecord::Migration
  def change
    create_table :refinery_page_resources do |t|
      t.integer :resource_id
      t.integer :page_id
      t.integer :position
    end

    add_index :refinery_page_resources, :resource_id
    add_index :refinery_page_resources, :page_id
  end
end
