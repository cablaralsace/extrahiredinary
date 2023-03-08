class ChangeContactNumberToBigInt < ActiveRecord::Migration[7.0]
  def up
    change_column :employees, :contact_number, :bigint
  end
end
