module Validacao

  class PlacaMae

    def self.marca_placa_mae(pedido)
      unless pedido.placa_mae.processadores_suportados.include?(pedido.processador.marca)
        pedido.errors.add(:placa_mae, :invalido, message: "Produto Placa mãe deve suportar o Produto Processador escolhido (#{pedido.processador.marca})!")
      end
    end

  end
end