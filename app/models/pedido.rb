class Pedido < ApplicationRecord
  belongs_to :processador, optional: true
  belongs_to :placa_mae
  belongs_to :placa_video
  has_and_belongs_to_many :memoria_rans

  # accepts_nested_attributes_for :memoria_rans

  def as_json(options={})
    super(
      root: true,
      only: [:id, :cliente],
      include: { 
        processador: { except: [:id, :created_at, :updated_at] },
        placa_mae: { except: [:id, :created_at, :updated_at] },
        placa_video: { except: [:id, :created_at, :updated_at] },
        memoria_rans: { except: [:id, :created_at, :updated_at] }
      }
    )
  end

end
