class Pedido < ApplicationRecord
  belongs_to :processador
  belongs_to :placa_mae
  belongs_to :placa_video, optional: true
  has_and_belongs_to_many :memoria_rans, optional: false

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
