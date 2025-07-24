class Sala < ApplicationRecord
  belongs_to :juego
  has_one_attached :imagen

  validate :al_menos_una_respuesta
  validate :al_menos_una_pista, on: :update

  private

  def al_menos_una_respuesta
    if [respuesta1, respuesta2, respuesta3].all?(&:blank?)
      errors.add(:base, "Debes ingresar al menos una respuesta")
    end
  end
  def al_menos_una_pista
  if [pista1, pista2, pista3].all?(&:blank?)
    errors.add(:base, "Debes ingresar al menos una de las nuevas pistas")
  end
end
end

