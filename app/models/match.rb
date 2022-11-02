class Match < ApplicationRecord
  belongs_to :learner, class_name: "User"
  belongs_to :tutor, class_name: "User"
  belongs_to :skill
  belongs_to :level
end
