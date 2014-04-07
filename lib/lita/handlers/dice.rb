require "lita"

module Lita
  module Handlers
    class Dice < Handler
      route(/^roll\s+(\d+)/i, :rollx, command: true, help: {
        'roll X' => 'Roll X dice'})

      route(/^roll\s+[^\d]/i, :roll, command: true, help: {
        'roll' => 'Roll one die'})

      def rollx(response)
        x = response.matches.first.first.to_i
        if x > 20
          return
        end
        s = ''
        (1..x).each do |n|
          s += (1..6).to_a.sample.to_s + ' '
        end
        response.reply s
      end

      def roll(response)
        response.reply (1..6).to_a.sample.to_s
      end
    end

    Lita.register_handler(Dice)
  end
end
