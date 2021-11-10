class ApplicationContract < Dry::Validation::Contract
  include Dry::Monads[:result]

  config.messages.backend = :i18n

  def validate_params(params)
    params = params.to_unsafe_hash if params.is_a?(ActionController::Parameters)
    result = self.(params)

    if result.success?
      Success(result.to_h)
    else
      error = InteractionErrors.validation_error(details: result.errors.to_h)
      Failure(error)
    end
  end
end
