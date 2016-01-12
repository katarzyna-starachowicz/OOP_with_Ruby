# Tic tac toe game

class Names_of_players

  def initialize
    @a = ""
    @b = ""
  end
  
  def take_names
    puts "What's Your name, First Player?"
    @a = gets.chomp
    puts "What's Your name, Second Player?"
    @b = gets.chomp
    if rand(2) == 0
      [@a, @b]
    else
      [@b, @a]
    end
  end
end

module Grid
  def welcome(x, o)
    puts "\nWelcome, #{x} and #{o} in Tic-tac-toe game!"
    puts "\nA a result of the draw #{x} will play with X and #{o} will play with O"
    puts "You will mark the space in 3x3 grid by choosing the number of the field:\n"
    puts "   1 | 2 | 3"
    puts "   ----------"
    puts "   4 | 5 | 6"
    puts "   ----------"
    puts "   7 | 8 | 9"
    puts "\n\n   Let's start! \n\n"
  end

  def show_grid(grid)
    puts "   #{grid[0]} | #{grid[1]} | #{grid[2]}"
    puts "   ----------"
    puts "   #{grid[3]} | #{grid[4]} | #{grid[5]}"
    puts "   ----------"
    puts "   #{grid[6]} | #{grid[7]} | #{grid[8]}"
  end

  def has_sb_win?(grid)
    case
    when grid[0] != " " && grid[0] == grid[1] && grid[1] == grid[2]
      puts "The game is over! The #{grid[0]} has won the game!"
      true
    when grid[3] != " " && grid[3] == grid[4] && grid[4] == grid[5]
      puts "The game is over! The #{grid[3]} has won the game!"
      true
    when grid[6] != " " && grid[6] == grid[7] && grid[7] == grid[8]
      puts "The game is over! The #{grid[6]} has won the game!"
      true
    when grid[0] != " " && grid[0] == grid[3] && grid[3] == grid[6]
      puts "The game is over! The #{grid[0]} has won the game!"
      true
    when grid[1] != " " && grid[1] == grid[4] && grid[4] == grid[7]
      puts "The game is over! The #{grid[1]} has won the game!"
      true
    when grid[2] != " " && grid[2] == grid[5] && grid[5] == grid[8]
      puts "The game is over! The #{grid[2]} has won the game!"
      true
    when grid[2] != " " && grid[2] == grid[4] && grid[4] == grid[6]
      puts "The game is over! The #{grid[2]} has won the game!"
      true
    when grid[0] != " " && grid[0] == grid[4] && grid[4] == grid[8]
      puts "The game is over! The #{grid[0]} has won the game!"
      true
    else
      false
    end
  end

  def choose_field(player, grid, x_or_o)
    puts "#{player}, Your turn! Which field do You mark?"
    mark = true
    while mark
      number = gets.chomp.to_i - 1
      if number.between?(0, 8) && grid[number] == " "
        grid[number] = x_or_o
        mark = false
      else
        puts "You must choose a number between 1 and 9 responding to the free field."
      end
    end
    true
  end

end


class Game < Names_of_players
  include Grid

  def initialize
    @x_player, @o_player = Names_of_players.new.take_names
    @grid = []
    9.times {@grid << " "}
    welcome(@x_player, @o_player)
  end

  def play
  	counter = 0
    while
      choose_field(@x_player, @grid, "X")
      show_grid(@grid)
      break if has_sb_win?(@grid)
      counter += 1
      if counter == 9
        puts "I'm so sorry, nobody has won. Let's play again!"
        @grid = []
        9.times {@grid << " "}
        counter = 0
      end
      choose_field(@o_player, @grid, "O")
      show_grid(@grid)
      break if has_sb_win?(@grid)
      counter += 1
      if counter == 9
        puts "I'm so sorry, nobody has won. Let's play again!"
        @grid = []
        9.times {@grid << " "}
        counter = 0
      end
    end
  end

end

Game.new.play