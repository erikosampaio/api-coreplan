module Validacao

  class PlacaVideo

    def self.video_integrado(pedido)
      unless pedido.placa_mae.video_integrado.downcase == "sim"
        pedido.errors.add(:placa_video, :invalido, message: "Obrigatório Placa de vídeo para placa mãe #{pedido.placa_mae.produto}!")
      end
    end

  end
end