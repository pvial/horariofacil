class CreateDedicacions < ActiveRecord::Migration[5.1]
  def change
    create_table :dedicacions do |t|
      t.integer :profesor_id
      t.integer :asignatura_id
      t.integer :dedicacion

      t.timestamps
    end
  end
end
