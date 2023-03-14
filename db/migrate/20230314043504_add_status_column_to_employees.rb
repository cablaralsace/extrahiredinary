class AddStatusColumnToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :status, :string
  end
end
