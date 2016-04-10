class AddNameAndMatrixNoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :matrix_no, :string
  end
end
