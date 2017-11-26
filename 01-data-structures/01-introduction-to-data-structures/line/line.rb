# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    members.push(person)
  end

  def leave(person)
    members.delete_if { |member| member == person }

  end

  def front
    members.first
  end

  def middle
    total_members = members.length
    middle_postion = (total_members/2.to_f).ceil
    members[middle_postion]
  end

  def back
    members.last
  end

  def search(person)
    result = nil
    members.each do |member|
      if member === person
        result = member
      end
    end
    return result
  end

  private

  def index(person)
  end

end
