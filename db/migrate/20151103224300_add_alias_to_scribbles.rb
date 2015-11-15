class AddAliasToScribbles < ActiveRecord::Migration
  def change
    add_column :scribbles, :alias_id, :integer
    add_index :scribbles, :alias_id
  end
end
