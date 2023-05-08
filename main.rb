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
    while(stolpec < 4)
        if game.check_color_and_position(vrstica,stolpec)
            puts "A color and a position matches"
        end
        stolpec += 1
    end
    vrstica += 1
end