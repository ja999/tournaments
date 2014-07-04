class Tournament
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  field :name,             type: String
  field :discipline,       type: String
  field :max_participants, type: Integer
  field :time_of_event,    type: DateTime
  field :deadline,         type: DateTime

  # belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :users

  validates :name, :discipline, :max_participants, :time_of_event, :deadline, presence: true
  validates :max_participants, numericality: { only_integer: true }
  validates :name, :discipline, length: { in: 2..200 }
end
