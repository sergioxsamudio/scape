class CreateJuegos < ActiveRecord::Migration[8.0]
  def change
    create_table :juegos do |t|
      t.string :logo
      t.string :titulo
      t.string :color_botones

      t.timestamps
    end
  end
end
