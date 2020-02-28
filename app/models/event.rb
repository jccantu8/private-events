class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :invitations, foreign_key: "invited_events_id", class_name: "Invitation"
    has_many :invitees, through: :invitations, source: :invitee

    validates :title, presence: true, length: { maximum: 50 }
    validates :description, presence: true, length: { maximum: 999 }
    validates :date, presence: true
    validates :location, presence: true, length: { maximum: 255 }
    validates :creator_id, presence: true

    scope :future, -> { where('date >= ?', Time.current) }

    scope :past, -> { where('date < ?', Time.current) }
end
