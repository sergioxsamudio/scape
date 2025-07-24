class JuegoPlayController < ApplicationController
  before_action :set_usuario
  before_action :set_juego
  before_action :set_salas

  def show_sala
    @sala = @salas[params[:sala_index].to_i]

    # 🏁 Si no hay más salas → Ganó
    unless @sala
      return redirect_to resultado_juego_play_path(resultado: "win", usuario_id: @usuario.id)
    end
  end

  def validar
    @sala = @salas[params[:sala_index].to_i]

    unless @sala
      return redirect_to resultado_juego_play_path(resultado: "win", usuario_id: @usuario.id)
    end

    if check_respuestas(params, @sala)
      next_sala_index = params[:sala_index].to_i + 1

      if @salas[next_sala_index]
        return redirect_to usuario_jugar_path(@usuario, sala_index: next_sala_index)
      else
        return redirect_to resultado_juego_play_path(resultado: "win", usuario_id: @usuario.id)
      end
    else
      return redirect_to resultado_juego_play_path(resultado: "lose", usuario_id: @usuario.id)
    end
  end

  def resultado
    @resultado = params[:resultado]
    @usuario = Usuario.find(params[:usuario_id])
    @juego = @usuario.juego
  end
  def set_usuario
  user_id = params[:usuario_id] || params['amp;usuario_id']
  @usuario = Usuario.find(user_id)
end


  private

  def set_usuario
    @usuario = Usuario.find(params[:usuario_id])
  end

  def set_juego
    @juego = @usuario.juego
  end

  def set_salas
    @salas = @juego.salas.order(:id)
  end

  def check_respuestas(params, sala)
    correctas = [sala.respuesta1, sala.respuesta2, sala.respuesta3].reject(&:blank?).map(&:strip).map(&:downcase)
    user_respuestas = [
      params[:respuesta1],
      params[:respuesta2],
      params[:respuesta3]
    ].reject(&:blank?).map(&:strip).map(&:downcase)

    correctas == user_respuestas
  end
end
