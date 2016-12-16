class AddOutputMaskToCustomFields < ActiveRecord::Migration
  def self.up
    add_column :custom_fields, :output_mask, :text, :null => true
  end
  
  def self.down
    remove_column :custom_fields, :output_mask
  end
end
