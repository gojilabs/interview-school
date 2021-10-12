module ApplicationHelper
  def to_time_string(minutes_from_midnight)
    hour = minutes_from_midnight / 60
    minute = (minutes_from_midnight % 60).to_s.rjust(2, '0')

    "#{hour}:#{minute}"
  end
end
