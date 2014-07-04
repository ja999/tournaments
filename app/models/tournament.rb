class Tournament
  include Mongoid::Document

  field :name, type: String
  field :discipline, type: String
  field :max_participants, type: Integer
  field :time_of_event, type: DateTime
  field :deadline, type: DateTime

  validates :name, :discipline, :max_participants, :time_of_event, :deadline, presence: true
  validates :max_participants, numericality: { only_integer: true }
  validates :name, :discipline, length: { in: 2..200 }
end
