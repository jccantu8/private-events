class User < ApplicationRecord
    #Since a user will be able to look at event they've been invited to and created, multiple
    #assoctiations will be used.
    has_many :invitations, foreign_key: "invitee_id"
    has_many :created_events, foreign_key: "creator_id", class_name: "Event"
    has_many :sent_invitations, foreign_key: "invitor_id", class_name: "Invitation"
    has_many :received_invitations, foreign_key: "invitee_id", class_name: "Invitation"
    has_many :invited_events, through: :invitations, source: :invited_events

    validates :username, presence: true, 
                         uniqueness: { case_sensitive: false }, 
                         length: { maximum: 15}, 
                         format: { with: /\A[a-zA-Z0-9]+\Z/, message: "Only allow letters and numbers" }

    def upcoming_events
        self.invited_events.where("date >= ?", Time.current)
    end

    def previous_events
        self.invited_events.where("date < ?", Time.current)
    end
end
