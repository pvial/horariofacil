class CreateSolucions < ActiveRecord::Migration[5.1]
  def change
    create_table :solucions do |t|
      t.integer :iteracion

      t.timestamps
    end
  end
end
