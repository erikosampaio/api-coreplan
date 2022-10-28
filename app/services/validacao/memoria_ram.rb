module Validacao

  class MemoriaRam

    def self.quantidade_memoria_ram(pedido)
      unless pedido.memoria_rans.size > 0
        pedido.errors.add(:memoria_rans, :invalido, message: "Obrigatório no mínimo 1 quantidade para Produto Memória Ram!")
      end
    end

    def self.quantidade_slots_memoria_ram(pedido)
      unless pedido.placa_mae.quantidade_slots_memoria >= pedido.memoria_rans.size
        pedido.errors.add(:memoria_rans, :invalido, message: "Quantidade dos Produtos Memória Ram superior a suportada pelo Produto Placa Mãe (Slots: #{pedido.placa_mae.quantidade_slots_memoria})!")
      end
    end

    def self.memoria_ram_suportada(pedido)
      unless pedido.placa_mae.total_memoria_suportada >= pedido.memoria_rans.map(&:tamanho).sum
        pedido.errors.add(:memoria_rans, :invalido, message: "Quantidade de memória não suportada pelo Produto Placa Mãe (Máximo: #{pedido.placa_mae.total_memoria_suportada}GB)!")
      end
    end

  end
end