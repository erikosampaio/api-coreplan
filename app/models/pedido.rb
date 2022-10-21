class Pedido < ApplicationRecord
  belongs_to :processador, optional: true
  belongs_to :placa_mae
  belongs_to :placa_video
  has_many :memoria_rans
  # has_and_belongs_to_many :memoria_rans

  accepts_nested_attributes_for :memoria_rans
end
