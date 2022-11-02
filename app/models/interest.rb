class Interest < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  belongs_to :level
end
