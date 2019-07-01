class CreateMusts < ActiveRecord::Migration[5.1]
  def change
    create_table :musts do |t|
      t.integer :curso_id
      t.integer :profesor_id
      t.string :creador

      t.timestamps
    end
  end
end
