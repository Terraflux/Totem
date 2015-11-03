class AddAliasToInscriptions < ActiveRecord::Migration
  def change
    add_column :inscriptions, :alias_id, :integer
    add_index :inscriptions, :alias_id
  end
end
