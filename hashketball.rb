require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
      },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
      },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
      },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
      },
        "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
      }
    }
  },

    :away => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, attribute|
    attribute.each do |attribute2, athlete_name|
      if attribute2 == :players
        athlete_name.each do |athlete_name2, stat_name|
          if athlete_name2 == player_name
            stat_name.each do |stat_name2, value|
              if stat_name2 == :points
                return value
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, attribute|
    attribute.each do |attribute2, athlete_name|
      if attribute2 == :players
        athlete_name.each do |athlete_name2, stat_name|
          if athlete_name2 == player_name
            stat_name.each do |stat_name2, value|
              if stat_name2 == :shoe
                return value
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, attribute|
    attribute.each do |attribute2, data|
      if (attribute2 == :team_name) && (data == team_name)
        attribute.each do |attribute3, data2|
          if attribute3 == :colors
            return data2
          end
        end
      end
    end
  end
end

def team_names
  team_names = []
  team_names << game_hash[:home][:team_name]
  team_names << game_hash[:away][:team_name]
  team_names
end

def player_numbers(team_name)
  array = []
  game_hash.each do |location, attribute|
    attribute.each do |attribute2, data|
      if (attribute2 == :team_name) && (data == team_name)
        attribute.each do |attribute3, data2|
          if attribute3 == :players
            data2.each do |data3, stat_names|
              stat_names.each do |stat_names2, value|
                if stat_names2 == :number
                  array << value
                end
              end
            end
          end
        end
      end
    end
  end
  array
end

def player_stats(player_name)
  result = Hash.new
  game_hash.each do |location, attribute|
    attribute.each do |attribute2, hashes|
      if attribute2 == :players
        hashes.each do |athlete_name, values|
         if athlete_name == player_name
           values.each do |key, value|
             result[key] = value
           end
          end
        end
      end
    end
  end
  result
end

def big_shoe_rebounds
  largest_shoe = nil
  largest_shoe_player = nil
  result = nil
  game_hash.each do |location, attribute|
    attribute.each do |attribute2, hashes|
      if attribute2 == :players
        hashes.each do |athlete_name, stats_hashes|
          stats_hashes.each do |key, value|
            if key == :shoe && (largest_shoe == nil || value > largest_shoe)
              largest_shoe = value
              largest_shoe_player = athlete_name
            end
          end
        end
      end
    end
  end
  game_hash.each do |location, attribute|
    attribute.each do |attribute2, hashes|
      if attribute2 == :players
        hashes.each do |athlete_name, stats_hashes|
          if athlete_name == largest_shoe_player
            stats_hashes.each do |key, value|
                if key == :rebounds
                  result = value
                end
            end
          end
        end
      end
    end
  end
  result
end

def most_points_scored
  number_of_points = nil
  player = nil
  game_hash.each do |location, attribute|
    attribute.each do |attribute2, value|
      if value == :player
        value.each do |value2, athlete_name|
          athlete_name.each do |athlete_name2, stat_name|
            if stat_name == :points
              stat_name.each do |stat_name2, stat_value|
                if number_of_points == nil || number_of_points < stat_value
                  number_of_points = stat_value
                  player = athlete_name2
                end
              end
            end
          end
        end
      end
    end
  end
  player
end

def winning_team

end

def player_with_longest_name

end

def long_name_steals_a_ton?

end
