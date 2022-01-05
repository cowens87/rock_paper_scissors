require 'csv'
require_relative './game_manager'
require_relative './team_manager'
require_relative './game_teams_manager'
require_relative './game_teams_season'
require_relative './game_teams_league'

class StatTracker
  attr_reader :games_manager, :teams_manager, :game_teams_manager,
              :game_teams_season, :game_teams_league
# makes a new stat_tracker obj based on the location
  def self.from_csv(locations)
    StatTracker.new(locations)
  end

  def initialize(locations)
    load_managers(locations)
  end

  def load_managers(locations)
    @games_manager = GamesManager.new(locations[:games], self)
    @teams_manager = TeamsManager.new(locations[:teams], self)
    @game_teams_manager = GameTeamsManager.new(locations[:game_teams], self)
    @game_teams_league = GameTeamsLeague.new(locations[:game_teams], self)
    @game_teams_season = GameTeamsSeason.new(locations[:game_teams], self)
  end

  # Game Statistics
  def highest_total_score
    @games_manager.highest_total_score
  end

  def lowest_total_score
    @games_manager.lowest_total_score
  end

  def percentage_home_wins
    @games_manager.percentage_home_wins
  end

  def percentage_visitor_wins
    @games_manager.percentage_visitor_wins
  end

  def percentage_ties
    @games_manager.percentage_ties
  end

  def count_of_games_by_season
    @games_manager.count_games_by_season
  end

  def average_goals_per_game
    @games_manager.average_goals_per_game
  end

  def average_goals_by_season
    @games_manager.average_goals_by_season
  end

  # League Statistics
  def count_of_teams
    @teams_manager.count_of_teams
  end

  def best_offense
    find_team_name(@game_teams_league.best_offense)
  end

  def worst_offense
    find_team_name(@game_teams_league.worst_offense)
  end

  def highest_scoring_visitor
    find_team_name(@game_teams_league.highest_scoring_visitor)
  end

  def lowest_scoring_visitor
    find_team_name(@game_teams_league.lowest_scoring_visitor)
  end

  def highest_scoring_home_team
    find_team_name(@game_teams_league.highest_scoring_home)
  end

  def lowest_scoring_home_team
    find_team_name(@game_teams_league.lowest_scoring_home)
  end

  # Season Statistics
  def winningest_coach(season_id)
    @game_teams_season.winningest_coach(season_id)
  end

  def worst_coach(season_id)
    @game_teams_season.worst_coach(season_id)
  end

  def most_accurate_team(season_id)
    find_team_name(@game_teams_season.most_accurate_team(season_id))
  end

  def least_accurate_team(season_id)
    find_team_name(@game_teams_season.least_accurate_team(season_id))
  end

  def most_tackles(season_id)
    find_team_name(@game_teams_season.most_tackles(season_id))
  end

  def fewest_tackles(season_id)
    find_team_name(@game_teams_season.fewest_tackles(season_id))
  end

  #Team Statistics
  def team_info(team_id)
    @teams_manager.team_info(team_id)
  end

  def best_season(team_id)
    @game_teams_manager.get_best_season(team_id)
  end

  def worst_season(team_id)
    @game_teams_manager.get_worst_season(team_id)
  end

  def average_win_percentage(team_id)
    @game_teams_manager.get_average_win_pct(team_id)
  end

  def most_goals_scored(team_id)
    @game_teams_manager.get_most_goals_scored_for_team(team_id)
  end

  def fewest_goals_scored(team_id)
    @game_teams_manager.get_fewest_goals_scored_for_team(team_id)
  end

  def favorite_opponent(team_id)
    find_team_name(@game_teams_manager.get_favorite_opponent(team_id))
  end

  def rival(team_id)
    find_team_name(@game_teams_manager.get_rival(team_id))
  end

  # Helpers
  def find_season_id(game_id)
    @games_manager.find_season_id(game_id)
  end

  def list_of_season_game_ids(season_id)
    @games_manager.list_of_season_game_ids(season_id)
  end

  def find_team_name(team_number)
    @teams_manager.find_team_name(team_number)
  end
end
