class Invitation < ApplicationRecord
    belongs_to :invitor, class_name: "User"
    belongs_to :invitee, class_name: "User"
    belongs_to :invited_events, class_name: "Event"

    validates :invitor_id, presence: true
    validates :invitee_id, presence: true
    validates :invited_event_id, presence: true

end
