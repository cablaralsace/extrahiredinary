class CreateEmploymentEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :employment_events do |t|
      t.string     :status
      t.text       :notes
      t.belongs_to :user
      t.belongs_to :employee

      t.timestamps
    end
  end
end
