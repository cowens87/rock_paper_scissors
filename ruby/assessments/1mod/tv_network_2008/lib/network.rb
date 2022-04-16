class Network
  attr_reader :name,
            :shows

  def initialize(name)
    @name  = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def all_characters
    @shows.flat_map { |show| show.characters }
  end

  def main_characters
    @shows.each_with_object([]) do |show, main_char|
      show.characters.each do |c|
        main_char << c if c.salary > 500_000 && (c.name.upcase == c.name)
      end
    end
  end

  def actors_by_show
    h = Hash.new {|h_obj, key| h_obj[key] = []}
    @shows.each { |s| s.characters.each { |c| h[s] << c.actor } }
    h
  end

  def shows_by_actor
    h = Hash.new {|h_obj, key| h_obj[key] = []}
    @shows.each { |s| s.characters.each { |c| h[c.actor] << s unless h[c.actor].include?(s) } }
    h
  end

  def prolific_actors
    shows_by_actor.select { |actor, shows| shows.count > 1 }.keys
  end
end
