class Juego < ApplicationRecord
  has_many :usuarios, dependent: :destroy
  has_many :salas, dependent: :destroy
  
  has_one_attached :logo
end
