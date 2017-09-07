class Upload < ActiveRecord::Migration
  def change
    add_column :orders, :file1, :string
    add_column :orders, :file2, :string
    add_column :orders, :file3, :string
  end
end