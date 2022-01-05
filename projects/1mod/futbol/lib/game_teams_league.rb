require_relative './averageable'
require_relative './game_team'
require_relative './game_teams_manager'

class GameTeamsLeague < GameTeamsManager
  include Averageable
  def games_played_by_type(team_id, home_away)
    @game_teams.select do |game_team|
      game_team.team_id == team_id && game_team.home_away == home_away
    end
  end

  def teams_list
    @game_teams.map do |game_team|
      game_team.team_id
    end.uniq
  end

  def total_goals(team_id)
    games_played(team_id).sum do |game|
      game.goals
    end.to_f
  end

  def average_number_of_goals_scored_by_team(team_id)
    average_with_count(total_goals(team_id), games_played(team_id), 2)
  end

  def total_goals_by_type(team_id, home_away)
    games_played_by_type(team_id, home_away).sum do |game|
      game.goals
    end.to_f
  end

  def avg_goals_team_type(team_id, home_away)
    goals = total_goals_by_type(team_id, home_away)
    games = games_played_by_type(team_id, home_away)
    average_with_count(goals, games)
  end

  def avg_goals_all_teams_hash
    hash = {}
    teams_list.each do |team_id|
      hash[team_id] ||= 0
      hash[team_id] = average_number_of_goals_scored_by_team(team_id)
    end
    hash
  end

  def avg_goals_team_type_hash(home_away)
    hash = {}
    teams_list.each do |team_id|
      hash[team_id] ||= 0
      hash[team_id] = avg_goals_team_type(team_id, home_away)
    end
    hash
  end

  def best_offense
    avg_goals_all_teams_hash.max_by { |_team_id, avg_goals| avg_goals }.to_a[0]
  end

  def worst_offense
    avg_goals_all_teams_hash.min_by { |_team_id, avg_goals| avg_goals }.to_a[0]
  end

  def highest_scoring_visitor
    hash = avg_goals_team_type_hash('away')
    hash.max_by { |_team_id, avg_goals| avg_goals }.to_a[0]
  end

  def lowest_scoring_visitor
    hash = avg_goals_team_type_hash('away')
    hash.min_by { |_team_id, avg_goals| avg_goals }.to_a[0]
  end

  def highest_scoring_home
    hash = avg_goals_team_type_hash('home')
    hash.max_by { |_team_id, avg_goals| avg_goals }.to_a[0]
  end

  def lowest_scoring_home
    hash = avg_goals_team_type_hash('home')
    hash.min_by { |_team_id, avg_goals| avg_goals }.to_a[0]
  end
end
