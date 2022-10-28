module Validacao

  class Cliente

    def self.execute(pedido)
      unless pedido.cliente
        pedido.errors.add(:cliente, :invalido, message: "Nome do cliente deve existir!")
      end
    end
  end
end