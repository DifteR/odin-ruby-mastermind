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
i = 1
j = 0
while(i<game.board_array.length)
    puts "Enter four colors seperated by spaces, from left to right"
    #game.board_array[i] << gets.chomp.split(" ")
    userinput = gets.chomp.split(" ")
    puts game.board_array
    game.input_colors(i, userinput)
    while(j < game.board_array.length)
        if game.check_color_and_position(j,i)
            puts "A color and a position matches"
        end
        j += 1
    end
    i += 1
end