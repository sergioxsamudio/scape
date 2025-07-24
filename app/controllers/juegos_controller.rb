class JuegosController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_juego, only: %i[ show edit update destroy ]

  # GET /juegos or /juegos.json
  def index
    @juegos = Juego.all
  end

  # GET /juegos/1 or /juegos/1.json
  def show
  end

  # GET /juegos/new
  def new
    @juego = Juego.new
  end

  # GET /juegos/1/edit
  def edit
  end

  # POST /juegos or /juegos.json
  def create
    @juego = Juego.new(juego_params)

    respond_to do |format|
      if @juego.save
        format.html { redirect_to @juego, notice: "Juego was successfully created." }
        format.json { render :show, status: :created, location: @juego }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @juego.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /juegos/1 or /juegos/1.json
  def update
    respond_to do |format|
      if @juego.update(juego_params)
        format.html { redirect_to @juego, notice: "Juego was successfully updated." }
        format.json { render :show, status: :ok, location: @juego }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @juego.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /juegos/1 or /juegos/1.json
  def destroy
    @juego.destroy!

    respond_to do |format|
      format.html { redirect_to juegos_path, status: :see_other, notice: "Juego was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def check_respuestas(user_respuestas, sala)
  correctas = [sala.respuesta1, sala.respuesta2, sala.respuesta3].reject(&:blank?)
  correctas.each_with_index.all? do |resp, i|
    user_input = user_respuestas["respuesta#{i + 1}"]
    user_input.to_s.strip.downcase == resp.to_s.strip.downcase
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_juego
      @juego = Juego.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def juego_params
      params.expect(juego: [ :logo, :titulo, :color_botones ])
    end
end
