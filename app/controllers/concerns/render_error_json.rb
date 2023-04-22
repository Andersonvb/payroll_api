module RenderErrorJson
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
  end

  def render_error_json(object, status)
    render 'errors/error', locals: { object: object }, formats: :json, status: status
  end

  def render_record_not_found
    render json: { error: [ message: 'Recurso no encontrado' ] }, status: :not_found
  end

  def render_invalid_model_id(model)
    render json: { error: [ message: "El #{model.to_s} no pertenece al usuario actual" ]}
  end
end