require_relative 'solver'
require_relative 'general_bactracking_solver'

module PaintShop
  class BacktrackingSolver < Solver
    def solve
      solution =
        PaintShop::GeneralBacktrackingSolver.new(
          values: %i(G M),
          safe_up_to: method(:satisfied_with?),
          size: @paints_count
        ).solve

        solution_string(solution)
    end

   private

    def satisfied_with?(solution, position)
      # return false if there is a customer whom all preferences are not satisfied
      # by current given partially solution
      return false if @customers.any? do |customer|
        customer.preferences.all? do |pref|
          pref.number <= position + 1 && pref.finish != solution[pref.number - 1]
        end
      end

      return true
    end
  end
end