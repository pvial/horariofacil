class CreateHoraLectivas < ActiveRecord::Migration[5.1]
  def change
    create_table :hora_lectivas do |t|
      t.integer :dia_id
      t.string :posicion
      t.boolean :activo
      t.integer :profesor_id

      t.timestamps
    end
  end
end
