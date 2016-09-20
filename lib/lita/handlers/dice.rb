require "lita"

module Lita
  module Handlers
    class Dice < Handler
      config :max_dice, type: Integer, default: 20
      config :max_sides, type: Integer, default: 1000
      route(/^roll(\s+(?<x>\d+)?d?(?<y>\d+)?)?/i, :roll, help: {
        'roll' => 'Roll one 6-sided die.',
        'roll X' => 'Roll X 6-sided dice.',
        'roll XdY' => 'Roll X Y-sided dice.'})

      route(/^(!(?<x>\d+)?d?(?<y>\d+)?)/, :roll)

      def roll(response)
        int = lambda do |n, default|
          if n == nil
            return default
          end
          n.to_i
        end

        x, y = response.matches.first
        if x.nil? and y.nil? then return end
        x = int.call(x, 1)
        y = int.call(y, 6)

        if x > config.max_dice or x < 1
          s = "#{response.user.name}: You can only roll between 1 and #{config.max_dice} dice."
        elsif y > config.max_sides or y < 2
          s = "#{response.user.name}: Dice must have between 2 and #{config.max_sides} sides."
        else
          rolls = []
          (1..x).each do |n|
            rolls << (1..y).to_a.sample
          end
          s = "#{response.user.name} rolled #{rolls.join(' ')}"
          if x > 1
            total = rolls.inject(:+)
            s += " (#{total})"
          end
        end
        response.reply s
      end
    end

    Lita.register_handler(Dice)
  end
end
