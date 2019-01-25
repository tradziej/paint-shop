require_relative 'parser'
require_relative 'backtracking_solver'

module PaintShop
  class CLI
    def self.start(argv=ARGV)
      prompt_message = Proc.new do
        puts 'Enter \'q\' to exit'
        puts 'Enter your data:'
      end
      prompt_message.call
      data = ""
      while (input = gets.chomp) != 'q' do
        data << "#{input}\n"
        if input.empty?
          parsed = PaintShop::Parser.parse(data, 'stream')
          solution = PaintShop::BacktrackingSolver.new(parsed).solve
          puts "Your solution is: #{solution}"
          data = ""
          prompt_message.call
        end
      end
    end
  end
end