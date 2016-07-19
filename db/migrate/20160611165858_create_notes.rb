class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :notes

      t.timestamps null: false
    end
  end
end
