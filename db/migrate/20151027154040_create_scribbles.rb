class CreateScribbles < ActiveRecord::Migration
  def change
    create_table :scribbles do |t|
      t.text :body
      t.references :inscription, index: true

      t.timestamps null: false
    end
    add_foreign_key :scribbles, :inscriptions
  end
end
