class AddSectionBreakToCustomFields < ActiveRecord::Migration
  def self.up
    add_column :custom_fields, :section_break, :boolean, :default => false, :null => false
  end
  
  def self.down
    remove_column :custom_fields, :section_break
  end
end
