class AddSlugToSketches < ActiveRecord::Migration
  def change
    add_column :sketches, :slug, :string
    add_index :sketches, :slug, unique: true
  end
end
