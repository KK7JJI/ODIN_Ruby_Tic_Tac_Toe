# frozen_string_literal: true

module TicTacToe
  # A match is played between two players until either
  # one player gets 3 in a row or the board is full.
  class Match
    attr_accessor :winner, :board, :match_end_status, :match_end_msg,
                  :match_round_counter, :turn_counter, :match_counter

    def self.new_match(match_count)
      new(match_count).call
    end

    def initialize(match_count)
      @board = nil
      @winner = nil
      @match_end_status = false
      @match_end_msg = ''
      @turn_counter = 0
      @match_round_counter = 0
      @match_counter = match_count
    end

    def call
      self
    end

    def match_ended?
      return true if match_end_status == true

      false
    end

    def increment_turn_counter
      self.turn_counter += 1
    end

    def increment_round_counter
      self.match_round_counter += 1
    end

    def update_match_status(status, msg = '')
      self.match_end_msg = msg
      self.match_end_status = status
    end

    def display_match_start_message
      puts '====================================='
      puts "BEGIN MATCH: #{@match_counter}"
      puts '====================================='
      puts ''
    end

    def display_match_end_message
      puts ''
      puts '====================================='
      puts "MATCH: #{@match_counter}"
      puts '====================================='
      puts "msg: '#{match_end_msg}'"
      print "match #{@match_counter} ended after "
      puts  "#{match_round_counter} rounds of play."
      puts ''
    end
  end
end
