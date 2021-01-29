class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    self.first_name + " " + self.last_name
  end

  def list_roles
    # self.characters.each {|c| print "#{c.name} - "}
    # self.shows.collect {|s| puts "#{s.name}"}
    # self.shows.all.each {|name| name.characters.name + " " + name.shows.name}
    self.characters.collect do |character|
        "#{character.name} - #{character.show.name}"
    end.join
  end

end