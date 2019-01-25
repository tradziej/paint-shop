require 'solver'

module PaintShop
  class NaiveSolver < Solver
    def solve
      solutions = []

      # check every possible combination for given paints
      # and gather only satisfying all customers
      all_combinations.each do |combination|
        solutions << combination if sorted_customers.all? do |customer|
          customer.satisfied_with?(combination)
        end
      end

      # return cheapest solution
      solution_string(solutions.sort.first)
    end

   private

    def all_combinations
      @all_combinations ||= %i(G M).repeated_permutation(@paints_count).to_a
    end

    def sorted_customers
      @sorted_customers ||= @customers.sort
    end
  end
end