class AddCodeToSketches < ActiveRecord::Migration
  def change
    add_column :sketches, :body, :text
  end
end
