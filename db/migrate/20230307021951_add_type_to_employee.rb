class AddTypeToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :type, :string
  end
end
