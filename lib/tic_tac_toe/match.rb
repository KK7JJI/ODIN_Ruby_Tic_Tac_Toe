module TicTacToe
  class Match
    @@match_count = 0
    attr_accessor :board, :match_end_status, :match_end_msg, :winner
    attr_accessor :match_round_counter, :turn_counter, :match_counter

    def self.new_match()
      @@match_count += 1
      new().call()
    end

    def initialize()
      @board = nil
      @winner = nil
      @match_end_status = false
      @match_end_msg = ""
      @turn_counter = 0
      @match_round_counter = 0
      @match_counter = @@match_count

    end

    def call()
      return self
    end

    def match_ended?()
      return true if match_end_status == true
      return false
    end

    def increment_turn_counter()
      self.turn_counter += 1
    end

    def increment_round_counter()
      self.match_round_counter += 1
    end

    def set_winner(player)
      self.winner = player
    end

    def update_match_status(status, msg="")
      self.match_end_msg = msg
      self.match_end_status = status
    end

    def display_match_start_message()
      puts "====================================="
      puts "BEGIN MATCH: #{@@match_count}"
      puts "====================================="
      puts ""

    end

    def display_match_end_message()
      puts ""
      puts "====================================="
      puts "MATCH: #{@@match_count}"
      puts "====================================="
      puts "msg: \'#{self.match_end_msg}\'"
      print "match #{@@match_count} ended after "
      puts  "#{match_round_counter} rounds of play."
      puts ""
    end
  end
end