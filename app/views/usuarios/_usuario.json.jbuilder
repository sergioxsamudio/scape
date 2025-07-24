json.extract! usuario, :id, :nombre, :correo, :cedula, :juego_id, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
