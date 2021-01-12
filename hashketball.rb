require 'pry'

# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

def players
  

def num_points_scored(player_name_request)
  home_player=game_hash[:home][:players]
  away_player=game_hash[:away][:players]
  all_players = home_player+away_player
  
  points_scored=all_players.find { |player| player[:player_name] ==player_name_request}[:points]
end

def shoe_size(player_name_request)
  size=nil
  game_hash.each do |team,team_information|

    team_information[:players].each do |stat_key|
      if stat_key[:player_name]==player_name_request

        size = stat_key[:shoe]
        break
      end
      #binding.pry
    end
  end
  #binding.pry
  
size  
end  

def team_colors(team_name_request)
  colors = []
  game_hash.each do |team,team_information|
      if team_information[:team_name]==team_name_request
        colors = team_information[:colors]
        break
      end
  end
colors  
end

def team_names
  team_names_array = game_hash.each_with_object ([]) do |(team,team_information),names|
    names << team_information[:team_name]
  end
end

def player_numbers (team_name_request)
  player_numbers_array = game_hash.each_with_object ([]) do |(team,team_information),numbers|
    if team_information[:team_name] == team_name_request
      team_information[:players].each do |stat_key|
        numbers << stat_key[:number]
      end
    end
  end
end

def player_stats (player_name_request)
  stats ={}
  game_hash.each do |team,team_information|
    team_information[:players].each do |stat_key|
      if stat_key[:player_name]==player_name_request
        stats = stat_key
        break
      end
    end
  end
 stats
end

def big_shoe_rebounds
  shoe_rebounds=0
  size = nil
  size = game_hash.map {|team,team_information| team_information[:players].map {|stats2| stats2[:shoe]}}.flatten.max
  #binding.pry
  game_hash.each do |team,team_information|
    #binding.pry
    team_information[:players].each do |stats|
      if stats[:shoe] == size
        shoe_rebounds=stats[:rebounds]
        break
      end
    end
  end
  #binding.pry
  shoe_rebounds
end

def most_points_scored
  name = nil
  points = game_hash.map {|team,team_information| team_information[:players].map {|stats2| stats2[:points]}}.flatten.max
  game_hash.each { |team,team_information| team_information[:players].each { |stats|
      if stats[:points] == points
        name=stats[:player_name]
        break
      end
  }}
  puts "#{name}, with #{points} points, scored the most points in the game"
end

def winning_team
  name = nil
  home = 0
  away = 0
  home = game_hash[:home][:players].map {|player_stats| player_stats[:points]}.flatten.sum 
    #note .map ruturns an updated hash/array/value. .flatten converst all of the results for the enumerable (in this case player_stats[:points]) into an array and sum adds them together
  away = game_hash[:away][:players].map {|player_stats| player_stats[:points]}.flatten.sum
  if home > away
    puts "#{game_hash[:home][:team_name]} won the game with #{home} points"
  elsif home < away
    puts "#{game_hash[:away][:team_name]} won the game with #{away} points"
  else
    puts "it was a tie"
  end
end

    