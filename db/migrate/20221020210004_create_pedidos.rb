class CreatePedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidos do |t|
      t.string :cliente
      t.references :processador, foreign_key: true
      t.references :placa_mae, foreign_key: true
      t.references :placa_video, foreign_key: true

      t.timestamps
    end
  end
end
