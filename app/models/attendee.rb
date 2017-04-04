class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def self.yes_calculation (id)
    if !Attendee.where(event_id: id).empty?
      total_attendees = Attendee.where(event_id: id)
      yes_attendees = total_attendees.where(attend: "yes").size.to_f
      yes_to_total = (yes_attendees / total_attendees.size.to_f)*100
   else
      yes_to_total = 0
    end
  end

  def self.no_calculation (id)
    if !Attendee.where(event_id: id).empty?
      total_attendees = Attendee.where(event_id: id)
      no_attendees = total_attendees.where(attend: "no").size.to_f
      no_to_total = (no_attendees / total_attendees.size.to_f)*100
    else
      no_to_total = 0
    end
  end
end
