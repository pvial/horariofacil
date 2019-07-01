class CreateNopuedes < ActiveRecord::Migration[5.1]
  def change
    create_table :nopuedes do |t|
      t.integer :modulo_id
      t.integer :asignatura_id

      t.timestamps
    end
  end
end
