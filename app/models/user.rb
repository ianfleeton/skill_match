class User < ApplicationRecord
  has_many :interests
  scope :learners, -> { where(tutor: false) }
  scope :tutors, -> { where(tutor: true) }

  def matches
    [].tap do |found|
      interests.each do |my_interest|
        matched_interests = Interest
          .joins(:user)
          .where(
            skill: my_interest.skill,
            level: my_interest.level,
            user: {tutor: !tutor}
          )

        matched_interests.each do |matched_interest|
          if tutor
            the_tutor = self
            the_learner = matched_interest.user
          else
            the_tutor = matched_interest.user
            the_learner = self
          end
          found << Match.new(
            tutor: the_tutor,
            learner: the_learner,
            skill: my_interest.skill,
            level: my_interest.level
          )
        end
      end
    end
  end
end
