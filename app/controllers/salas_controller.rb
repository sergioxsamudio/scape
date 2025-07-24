class SalasController < ApplicationController
  before_action :authenticate_admin!

  before_action :set_sala, only: %i[ show edit update destroy ]

  # GET /salas or /salas.json
  def index
    @salas = Sala.all
  end

  # GET /salas/1 or /salas/1.json
  def show
  end

  # GET /salas/new
  def new
    @sala = Sala.new
    @sala.juego_id = params[:juego_id] if params[:juego_id].present?
  end

  # GET /salas/1/edit
  def edit
  end

  # POST /salas or /salas.json
  def create
    @sala = Sala.new(sala_params)

    respond_to do |format|
      if @sala.save
        format.html { redirect_to @sala, notice: "Sala was successfully created." }
        format.json { render :show, status: :created, location: @sala }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salas/1 or /salas/1.json
  def update
    respond_to do |format|
      if @sala.update(sala_params)
        format.html { redirect_to @sala, notice: "Sala was successfully updated." }
        format.json { render :show, status: :ok, location: @sala }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salas/1 or /salas/1.json
  def destroy
    @sala.destroy!

    respond_to do |format|
      format.html { redirect_to salas_path, status: :see_other, notice: "Sala was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sala
      @sala = Sala.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def sala_params
  params.require(:sala).permit(
    :respuesta1, :respuesta2, :respuesta3, 
    :pista1, :pista2, :pista3, 
    :tiempo, :imagen, :juego_id
  )
end

end
