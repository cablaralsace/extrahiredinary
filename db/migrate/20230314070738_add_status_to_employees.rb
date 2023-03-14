class AddStatusToEmployees < ActiveRecord::Migration[7.0]
  def change
    def change
      add_column :employees, :status, :string
    end
  end
end
