module PaintShop
  class GeneralBacktrackingSolver
    def initialize(values: [], safe_up_to:, size:)
      @values = values
      @safe_up_to = safe_up_to
      @size = size
    end

    def solve
      # Prepare starting array of possible solution, e.g. [nil, nil, ..., nil]
      solution = Array.new(@size)
      get_solution(solution, 0)
    end

   private

    def get_solution(solution, position)
      @values.each do |finish|
        solution[position] = finish
        # check if current partial solution is correct
        if @safe_up_to.call(solution, position)
          if position >= solution.size - 1 || get_solution(solution, position + 1)
            return solution
          end
        end
      end

      # returns nil if no solution
      return nil
    end
  end
end