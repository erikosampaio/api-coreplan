class CreatePlacaMaes < ActiveRecord::Migration[5.2]
  def change
    create_table :placa_maes do |t|
      t.string :produto
      t.string :processadores_suportados
      t.integer :quantidade_slots_memoria
      t.integer :total_memoria_suportada
      t.string :video_integrado

      t.timestamps
    end
  end
end
