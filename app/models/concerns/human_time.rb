module HumanTime
  extend ActiveSupport::Concern

  HUMAN_TIME_REGEX = /\A(0?[1-9]|1[0-2]):([0-5]\d)\s?((?:A|P)\.?M\.?)\z/i

  def cast_time(value)
    return nil unless value.present?

    match = value.match(HUMAN_TIME_REGEX)
    return nil unless match

    hours, minutes, part = match.captures
    hours = hours.to_i
    hours = hours + 12 if part.upcase == 'PM'
    hours * 60 + minutes.to_i
  end
end