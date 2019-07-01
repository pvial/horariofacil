class CreateDepartamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :departamentos do |t|
      t.integer :colegio_id
      t.string :nombre

      t.timestamps
    end
  end
end
