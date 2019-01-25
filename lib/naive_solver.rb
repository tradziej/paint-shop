module PaintShop
  class NaiveSolver
    def initialize(paints_count:, customers: [])
      raise 'Paints number can\'t be nil' if paints_count.nil?
      raise 'Paints number must be Integer' unless paints_count.is_a?(Integer)
      raise 'Paints number must be greater than 1' if paints_count < 1
      @paints_count = paints_count

      raise 'Customers array can\'t be nil' if customers.nil?
      raise 'Customers isn\'t an array' unless customers.is_a?(Array)
      @customers = customers
    end

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

    def solution_string(solution)
      return 'No solution exists' unless solution
      solution.map(&:to_s).join(' ')
    end
  end
end