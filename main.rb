class PlayingBoard
    attr_accessor :board_array
    def initialize
        @board_array = Array.new(13) {Array.new(4)}
    end

    def random_color_generator
        colors = %w[red blue green yellow black white]
        return colors.sample
    end

    def computer_generated_code()
        i = 0
        while i<4
            @board_array[0][i] = random_color_generator
            i += 1 
        end
    end

    def input_colors(vrstica, barve)
        i = 0
        while i<4
            @board_array[vrstica][i] = barve[i]
            i += 1
        end
    end

    def check_color_and_position(vrstica, stolpec)
        if @board_array[vrstica][stolpec] == @board_array [0][stolpec]
            return true
        else return false
        end
    end

    def check_only_color_match(vrstica)
        stolpec = 0
        rezultat = false
        while(stolpec < 4)
            stolpec2 = 0
            while(stolpec2 < 4)
                if @board_array[vrstica][stolpec2] == @board_array [0][stolpec]
                    rezultat = true
                #else rezultat = false
                end
                stolpec2 += 1
            end
            stolpec += 1
        end
        return rezultat
    end

    def check_winner(vrstica)
        if @board_array[vrstica][0] == @board_array[0][0] &&
           @board_array[vrstica][1] == @board_array[0][1] &&
           @board_array[vrstica][2] == @board_array[0][2] &&
           @board_array[vrstica][3] == @board_array[0][3]
          true
        else
          false
        end
      end
      

end

game = PlayingBoard.new()
game.computer_generated_code
puts game.board_array
vrstica = 1
while(vrstica<game.board_array.length)
    stolpec = 0
    puts "Enter four colors seperated by spaces, from left to right"
    userinput = gets.chomp.split(" ")
    puts game.board_array
    game.input_colors(vrstica, userinput)
    if(game.check_only_color_match(vrstica))
        puts "A color matches"
    end
    while(stolpec < 4)
        if game.check_color_and_position(vrstica,stolpec)
            puts "A color and a position matches"
        end
        stolpec += 1
    end
    if game.check_winner(vrstica)
        puts "You won! The encoder gets #{vrstica} points!"
        break
    end
    vrstica += 1
end