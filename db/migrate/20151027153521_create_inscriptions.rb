class CreateInscriptions < ActiveRecord::Migration
  def change
    create_table :inscriptions do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
