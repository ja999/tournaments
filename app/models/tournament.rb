class Tournament
  include Mongoid::Document

  field :name, type: String
  field :disciplin, type: String
  field :max_participants, type: Integer
  field :time_of_event, type: DateTime
  field :deadline, type: DateTime
end
