class PlayingBoard
    attr_accessor :board_array
    def initialize
        @board_array = Array.new(13) {Array.new(4)}
    end

    def random_color_generator
        colors = %w[red blue green yellow black white]
        random_color = colors.sample
    end

    def computer_generated_code()
        i = 0
        while i<4
            @board_array[0][i] = random_color_generator
            i +=1 
        end
    end
end

game = PlayingBoard.new()
game.computer_generated_code
puts game.board_array