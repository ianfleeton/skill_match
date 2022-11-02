require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "#create_matches" do
    # Learners
    ingrid = User.create!(name: "Ingrid", tutor: false)
    penny = User.create!(name: "Penny", tutor: false)
    thomas = User.create!(name: "Thomas", tutor: false)

    # Tutors
    georgia = User.create!(name: "Georgia", tutor: true)
    frank = User.create!(name: "Frank", tutor: true)
    william = User.create!(name: "William", tutor: true)

    # Skills
    ruby = Skill.create!(name: "Ruby")
    japanese = Skill.create!(name: "Japanese")

    # Levels
    beginner = Level.create!(name: "Beginner")
    intermediate = Level.create!(name: "Intermediate")
    advanced = Level.create!(name: "Advanced")

    # Interests for learners
    Interest.create!(user: ingrid, skill: ruby, level: beginner)
    Interest.create!(user: penny, skill: ruby, level: advanced)
    Interest.create!(user: penny, skill: japanese, level: beginner)
    Interest.create!(user: thomas, skill: ruby, level: intermediate)
    Interest.create!(user: thomas, skill: japanese, level: beginner)

    # Interests for tutors
    Interest.create!(user: frank, skill: ruby, level: beginner)
    Interest.create!(user: georgia, skill: ruby, level: advanced)
    Interest.create!(user: william, skill: japanese, level: beginner)

    matches = ingrid.matches
    assert_equal 1, matches.count
    match = matches.first
    assert_equal ingrid, match.learner
    assert_equal frank, match.tutor
    assert_equal ruby, match.skill
    assert_equal beginner, match.level

    matches = penny.matches
    assert_equal 2, matches.count
    match = matches.first
    assert_equal penny, match.learner
    assert_equal georgia, match.tutor
    assert_equal ruby, match.skill
    assert_equal advanced, match.level
    match = matches.second
    assert_equal penny, match.learner
    assert_equal william, match.tutor
    assert_equal japanese, match.skill
    assert_equal beginner, match.level

    matches = thomas.matches
    assert_equal 1, matches.count
    match = matches.first
    assert_equal thomas, match.learner
    assert_equal william, match.tutor
    assert_equal japanese, match.skill
    assert_equal beginner, match.level

    matches = georgia.matches
    assert_equal 1, matches.count
    match = matches.first
    assert_equal penny, match.learner
    assert_equal georgia, match.tutor
    assert_equal ruby, match.skill
    assert_equal advanced, match.level

    matches = william.matches
    assert_equal 2, matches.count
    match = matches.first
    assert_equal penny, match.learner
    assert_equal william, match.tutor
    assert_equal japanese, match.skill
    assert_equal beginner, match.level
    match = matches.second
    assert_equal thomas, match.learner
    assert_equal william, match.tutor
    assert_equal japanese, match.skill
    assert_equal beginner, match.level
  end
end
