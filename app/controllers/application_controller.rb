class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  class ApplicationController < ActionController::Base
  # Redirigir a /juegos después de iniciar sesión
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      juegos_path # Redirige a la lista de juegos
    else
      super
    end
  end
end

end
