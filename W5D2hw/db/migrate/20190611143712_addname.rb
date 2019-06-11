class Addname < ActiveRecord::Migration[5.1]
  def change
    add_column :toys, :name, :string
  end
end
