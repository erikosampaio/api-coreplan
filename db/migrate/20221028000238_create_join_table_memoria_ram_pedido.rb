class CreateJoinTableMemoriaRamPedido < ActiveRecord::Migration[5.2]
  def change
    create_join_table :memoria_rans, :pedidos
  end
end
