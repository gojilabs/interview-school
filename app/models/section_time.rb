class SectionTime < ApplicationRecord
  enum day: Date::DAYNAMES

  belongs_to :section
  belongs_to :classroom

  def end_time
    start_time + duration
  end
end
