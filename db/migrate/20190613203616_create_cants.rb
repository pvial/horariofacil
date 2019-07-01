class CreateCants < ActiveRecord::Migration[5.1]
  def change
    create_table :cants do |t|
      t.integer :curso_id
      t.integer :profesor_id
      t.string :creador

      t.timestamps
    end
  end
end
