class AddProfeIdToSolProves < ActiveRecord::Migration[5.1]
  def change
    add_column :sol_proves, :profe_id, :integer
  end
end
