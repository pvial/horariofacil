class CreateRequerimientos < ActiveRecord::Migration[5.1]
  def change
    create_table :requerimientos do |t|
      t.integer :nivel_id
      t.integer :ramo_id

      t.timestamps
    end
  end
end
