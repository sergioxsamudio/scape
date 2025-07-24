class BusquedasController < ApplicationController
  def new
  
  end

  def create
    titulo = params[:titulo].strip
    juego = Juego.find_by(titulo: titulo)

    if juego
      # Si encuentra el juego, redirige a crear usuario con el juego preasociado
      redirect_to new_usuario_path(juego_id: juego.id)
    else
      # Si no existe, muestra error y vuelve al formulario
      flash[:alert] = "No se encontró ningún juego con el título '#{titulo}'. Intenta nuevamente."
      render :new, status: :unprocessable_entity
    end
  end
end
