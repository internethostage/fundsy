require 'rails_helper'

RSpec.describe Campaign, type: :model do
# We are using describe to find a group of test examples for model validations
  describe "validations" do

# you use it or specify to define a test example. The first argument to "it" is a string that describes what you want to test. You write your test within a block you pass to the "it"
    it "requires a title" do
      #GIVEN: campaign with no title
      c = Campaign.new

      #WHEN: we validate the campaign
      validation_outcome = c.valid?

      #THEN: validation_outcome is false
      expect(validation_outcome).to eq(false)
    end

    it "requires a goal" do
      #Given : campaign with no goal
      c = Campaign.new

      #WHEN : we validate the campaign
      c.valid?

      #THEN: There is an error on :goal
      expect(c.errors).to have_key(:goal)
    end

    it "requirea the goal to be more than $10 do" do
      c = Campaign.new(goal: 9)
      c.valid?
      expect(c.errors).to have_key(:goal)
    end

    it "requires a unique title" do
      c = Campaign.new(title: "Hey", goal: 11)
      c.save
      d = Campaign.new(title: "Hey", goal: 11)
      d.valid?
      expect(d.errors).to have_key(:title)
    end
  end

    #its a convention to put the method named preficed with a . if your testng a method (in the describe)
  describe ".upcased_title" do
    it "returns an upcased title" do
      #GIVEN
      c = Campaign.new title: "hello", goal:11
      #WHEN
      result = c.upcased_title
      #THEN
      expect(result).to eq("HELLO")

    end

  end
end
