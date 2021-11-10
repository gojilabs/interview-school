module InteractionErrors
  module_function

  def validation_error(message: "Some fields are invalid", details:)
    interaction_error(message: message, details: details, type: "validation_error")
  end

  def flow_error(message)
    interaction_error(message: message, details: details, type: "flow_error")
  end

  def interaction_error(message:, details:, type:)
    { message: message, details: details, type: type }
  end
end
