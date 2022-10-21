class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :update, :destroy]

  # GET /pedidos
  def index
    @pedidos = Pedido.all

    render json: @pedidos, include: [:processador, :placa_mae, :placa_video]
  end

  # GET /pedidos/1
  def show
    render json: @pedido, include: [:processador, :placa_mae, :placa_video]
  end

  # POST /pedidos
  def create
    @pedido = Pedido.new(pedido_params)
    
    if @pedido.save
      render json: @pedido, include: [:processador, :placa_mae, :placa_video]
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
        :cliente, :processador_id, :placa_mae_id, :placa_video_id,
        memoria_rans_attributes: [:id, :produto, :tamanho]
      )
    end
end
