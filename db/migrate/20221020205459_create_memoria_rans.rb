class CreateMemoriaRans < ActiveRecord::Migration[5.2]
  def change
    create_table :memoria_rans do |t|
      t.string :produto
      t.integer :tamanho

      t.timestamps
    end
  end
end
