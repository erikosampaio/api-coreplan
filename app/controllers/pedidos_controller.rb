class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :update, :destroy]

  # GET /pedidos
  def index
    @pedidos = Pedido.all

    render json: @pedidos#, only: [:id, :cliente], include: [:processador, :placa_mae, :placa_video, :memoria_rans]
  end

  # GET /pedidos/1
  def show
    render json: @pedido#, only: [:id, :cliente], include: [:processador, :placa_mae, :placa_video, :memoria_rans]
  end

  # POST /pedidos
  def create
    @pedido = Pedido.new(pedido_params)
    memorias_ram = MemoriaRam.find((params[:memoria_rans].pluck(:id)))
    @pedido.memoria_rans << memorias_ram
    
    validacoes_pedido

    unless @pedido.errors.present?
      if @pedido.save
        render json: @pedido, include: [:processador, :placa_mae, :placa_video]
      else
        render json: @pedido.errors, status: :unprocessable_entity
      end
    else
      render json: @pedido.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pedidos/1
  def update
    if @pedido.update(pedido_params)
      render json: @pedido, include: [:processador, :placa_mae, :placa_video]
    else
      render json: @pedido.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pedidos/1
  def destroy
    @pedido.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pedido_params
      params.require(:pedido).permit(
        :cliente, :processador_id, :placa_mae_id, :placa_video_id
      )
    end

    def validacoes_pedido
      Validacao::Cliente.execute(@pedido)
      Validacao::PlacaMae.marca_placa_mae(@pedido)
      Validacao::MemoriaRam.quantidade_memoria_ram(@pedido)
      Validacao::MemoriaRam.quantidade_slots_memoria_ram(@pedido)
      Validacao::MemoriaRam.memoria_ram_suportada(@pedido)
      Validacao::PlacaVideo.video_integrado(@pedido)
    end
end
