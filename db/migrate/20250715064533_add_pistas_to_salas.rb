class AddPistasToSalas < ActiveRecord::Migration[8.0]
  def change
    add_column :salas, :pista1, :string
    add_column :salas, :pista2, :string
    add_column :salas, :pista3, :string
  end
end
