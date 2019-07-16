class CreateHaces < ActiveRecord::Migration[5.1]
  def change
    create_table :haces do |t|
      t.integer :profesor_id
      t.integer :nivel_id
      t.boolean :hace

      t.timestamps
    end
  end
end
