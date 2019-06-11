class Addvalue < ActiveRecord::Migration[5.1]
  def change
    remove_column :toys, :name

  end
end
