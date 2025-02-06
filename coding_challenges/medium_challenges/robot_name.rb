=begin
For our program, the details we need to keep in mind are as follows:

Since robot names are created randomly without input from a user,
our program doesn't need to expect any input argument. The name we
later return will be a string.

A robot's name is generated the first time it is booted up after being
manufactured as well as the first time it is booted up after a factory reset.

The randomly generated names seem to follow a pattern of 2 uppercase
alphabetic characters followed by three digits.
=end

class Robot
  @@robot_names = []

  def initialize
    @name = generate_name
  end

  def name
    @name ? @name : generate_name
  end

  def reset
    @@robot_names.delete(@name)
    @name = nil
  end

  def self.robot_names
    @@robot_names
  end

  private

  def generate_name
    new_name = ''
    loop do
      2.times do
        new_name += ("A".."Z").to_a.sample
      end
      new_name += rand(100..999).to_s
      break unless @@robot_names.any?(new_name)
      new_name = ''
    end

    @@robot_names << new_name
    @name = new_name
  end
end