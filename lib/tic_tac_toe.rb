require 'pry'

class TicTacToe
    
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [
        [0,1,2], [3,4,5], [6,7,8], 
        [0,3,6], [1,4,7], [2,5,8], 
        [0,4,8], [2,4,6]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        index = input.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == " "
            return false
        else
            return true
        end
    end

    def valid_move?(index)
        if @board[index] == " "
            return true
        else
            return false
        end
    end

    def turn_count
        num_blank = []
        @board.each do |token|
            if token == " "
                num_blank << token
            end
            num_blank
        end
        turn_count = 9 - num_blank.length
        turn_count
    end

    def current_player
        if turn_count.odd? == false
            return "X"
        else
            return "O"
        end
    end

    def turn
        puts "Please enter 1-9:"
        input = gets
        index = input_to_index(input)
        player = current_player
        if valid_move?(index)
            move(index, player)
            display_board
        else
            puts "Please enter 1-9 but pay more attention this time!"
            input = gets
            index = input_to_index(input)
            player = current_player
                if valid_move?(index)
                    move(index, player)
                    display_board
                else
                    "too bad"
            end
        end
    end

    def won?
        x_indexes = []
        o_indexes = []
        winner = false
        @board.each_with_index do |value, index|
            if value == "X"
                x_indexes << index
            elsif value == "O"
                o_indexes << index
            end
        end

        WIN_COMBINATIONS.each do |winning_array|
            if (winning_array - x_indexes).empty?
                winner = winning_array
                @winning_player = "X"
            elsif (winning_array - o_indexes).empty?
                winner = winning_array
                @winning_player = "O"
            end
        end

        return winner
    end

    def full?
        unless @board.include?(" ")
            return true
        end
    end

    def draw?
        full? && !won?
    end

    def over?
        if draw? || won?
            true
        elsif full? == false
            false
        end
    end

    def winner
        won?
        return @winning_player
    end


    def play
        turn until over?
            if won?
                puts "Congratulations #{@winning_player}!"
            elsif draw?
                puts "Cat's Game!"
            end
    end

end