require_relative 'parser'
require_relative 'backtracking_solver'

module PaintShop
  class CLI
    def self.start(argv=ARGV)
      if argv.length != 1
        puts 'Usage: ./bin/paint-shop <input_file>'
        exit(1)
      end

      if File.exist?(argv[0])
        input = argv[0]
        data = File.read(input)
        parsed = PaintShop::Parser.parse(data, 'stream')
        solution = PaintShop::BacktrackingSolver.new(parsed).solve
        if solution
          puts solution
        else
          puts 'No solution exists'
          exit(1)
        end
      end
    end
  end
end