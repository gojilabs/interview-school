class SessionTimeType < ActiveModel::Type::String
  def cast(value)
    return nil unless value.present?

    match = string.match(/^([0-1]?[0-9]|2[0-3]):([0-5][0-9])$/)
    return nil unless match

    hours, minutes = match.captures
    hours * 60 + minutes
  end
end