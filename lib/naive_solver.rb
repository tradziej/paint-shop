module PaintShop
  class NaiveSolver
    def initialize(colors_number:, customers: [])
      raise 'Colors number can\'t be nil' if colors_number.nil?
      raise 'Colors number must be Integer' unless colors_number.is_a?(Integer)
      raise 'Colors number must be greater than 1' if colors_number < 1
      @colors_number = colors_number

      raise 'Customers array can\'t be nil' if customers.nil?
      raise 'Customers isn\'t an array' unless customers.is_a?(Array)
      @customers = customers
    end

    def solve
      solutions = []

      # check every possible combination for given colors
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
      @all_combinations ||= %i(G M).repeated_permutation(@colors_number).to_a
    end

    def sorted_customers
      @sorted_customers ||= @customers.sort
    end

    def solution_string(solution)
      return 'No solution exists' unless solution
      solution.map(&:to_s).join(' ')
    end
  end
end