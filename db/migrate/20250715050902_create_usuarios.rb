class CreateUsuarios < ActiveRecord::Migration[8.0]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :correo
      t.string :cedula
      t.references :juego, null: false, foreign_key: true

      t.timestamps
    end
  end
end
