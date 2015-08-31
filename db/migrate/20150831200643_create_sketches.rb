class CreateSketches < ActiveRecord::Migration
  def change
    create_table :sketches do |t|
      t.string :title
      t.boolean :private
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
