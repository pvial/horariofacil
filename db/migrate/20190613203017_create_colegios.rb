class CreateColegios < ActiveRecord::Migration[5.1]
  def change
    create_table :colegios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
