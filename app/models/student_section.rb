class StudentSection < ApplicationRecord
  before_save :has_overlaps?

  belongs_to :student
  belongs_to :section

  def has_overlaps?
    student_sections = Section.includes(:students).where(students: { id: student.id })
    newly_created_section_time_range = format_section_time_into_interval(section.time_start, section.time_length)

    student_sections.each do |student_section|
      # Checking if for example ["M", "W", "F"] has intersection with ["M", "T", "W", "TH", "F"]
      if (section.week_days.split('/') & section.week_days.split('/')).present?
        # If so, checking if we have time overlapping
        section_time_range = format_section_time_into_interval(student_section.time_start, student_section.time_length)
        raise_overlap_error if newly_created_section_time_range.overlaps?(section_time_range)
      end
    end
  end

  private

  def raise_overlap_error
    errors.add('Section overlap error, ', 'please reschedule your section')
    raise ActiveRecord::RecordInvalid.new(self)
  end

  def format_section_time_into_interval(time_start, length)
    time_start_calculated = Time.parse("#{time_start.hour}:#{time_start.min}")
    time_end_calculated = time_start + length.minutes
    time_end = Time.parse("#{time_end_calculated.hour}:#{time_end_calculated.min}")
    (time_start_calculated..time_end)
  end
end
