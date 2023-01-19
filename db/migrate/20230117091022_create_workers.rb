class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :shift
      t.date :date

      t.timestamps
    end
  end
end
