class CreateSalas < ActiveRecord::Migration[8.0]
  def change
    create_table :salas do |t|
      t.string :respuesta1
      t.string :respuesta2
      t.string :respuesta3
      t.string :imagen
      t.integer :tiempo
      t.references :juego, null: false, foreign_key: true

      t.timestamps
    end
  end
end
