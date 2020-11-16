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

def num_points_scored(player_name)
  game_hash.each do |host, team_attributes|
    team_attributes[:players].each do |player_stats|
      if player_stats[:player_name] == player_name
        return player_stats[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |host, team_attributes|
    team_attributes[:players].each do |player_stats|
      if player_stats[:player_name] == player_name
        return player_stats[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |host, team_attributes|
    if team_attributes[:team_name] == team_name
      return team_attributes[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |host, team_attributes|
    teams << team_attributes[:team_name]
  end
  teams
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |host, team_attributes|
    if team_attributes[:team_name] == team_name
      team_attributes[:players].each do |player_stats|
        jersey_numbers << player_stats[:number]
      end
    end
  end
  jersey_numbers
end

def player_stats(player_name)
  game_hash.each do |host, team_attributes|
    team_attributes[:players].each do |player_stats|
      if player_stats[:player_name] == player_name
        return player_stats
      end
    end
  end
end

def big_shoe_rebounds
  rebounds_from_big_shoe = 0
  biggest_shoe = 0
  game_hash.each do |host, team_attributes|
    team_attributes[:players].each do |player_stats|
      if player_stats[:shoe] > biggest_shoe
        biggest_shoe = player_stats[:shoe]
        rebounds_from_big_shoe = player_stats[:rebounds]
      end
    end
  end
  rebounds_from_big_shoe
end

def most_points_scored
  most_points = 0
  mvp = ""
  game_hash.each do |host, team_attributes|
    team_attributes[:players].each do |player_stats|
      if player_stats[:points] > most_points
        most_points = player_stats[:points]
        mvp = player_stats[:player_name]
      end
    end
  end
  puts "#{mvp} scored the most points, with #{most_points} points!"
  mvp
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash.each do |host, team_attributes|
    team_attributes[:players].each do |player_stats|
      if host == :home
        home_points += player_stats[:points]
      elsif host == :away
        away_points += player_stats[:points]
      end
    end
  end
  if home_points > away_points
    "#{game_hash[:home][:team_name]} is the winning team! Score: #{home_points} to #{away_points}"
  elsif home_points < away_points
    "#{game_hash[:away][:team_name]} is the winning team! Score: #{home_points} to #{away_points}"
  else
    "Tie!"
  end
end

def player_with_longest_name
  long_name_length = 0
  long_name_player = ""
  game_hash.each do |host, team_attributes|
    team_attributes[:players].each do |player_stats|
      if player_stats[:player_name].length > long_name_length
        long_name_length = player_stats[:player_name].length
        long_name_player = player_stats[:player_name]
      end
    end
  end
  puts "#{long_name_player} has the longest name!"
  long_name_player
end

def long_name_steals_a_ton
  most_steals = 0
  thief = ""
  game_hash.each do |host, team_attributes|
    team_attributes[:players].each do |player_stats|
      if player_stats[:steals] > most_steals
        most_steals = player_stats[:steals]
        thief = player_stats[:player_name]
      end
    end
  end
  if player_with_longest_name == thief
    puts "The player with the longest name, #{player_with_longest_name}, had the most steals!"
    return true
  else
    puts "The player with the longest name, #{long_name_player}, did not have the most steals."
    return false
  end
end
