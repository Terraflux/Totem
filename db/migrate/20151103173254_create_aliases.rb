class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.string :name
      t.string :ipad

      t.timestamps null: false
    end
  end
end
