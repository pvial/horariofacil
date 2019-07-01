class CreateProfesors < ActiveRecord::Migration[5.1]
  def change
    create_table :profesors do |t|
      t.integer :departamento_id
      t.string :nombre

      t.timestamps
    end
  end
end
