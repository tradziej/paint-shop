module PaintShop
  class BacktrackingSolver
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
      # Prepare starting array of possible solution, e.g. [nil, nil, ..., nil]
      solution = Array.new(@colors_number)
      solution = get_solution(solution, 0)

      solution_string(solution)
    end

   private

    def get_solution(solution, position)
      %i(G M).each do |finish|
        solution[position] = finish
        # check if current solution satisfy all customers
        if satisfied_with?(solution, position)
          if position >= solution.size - 1 || get_solution(solution, position + 1)
            return solution
          end
        end
      end

      # returns nil if no solution
      return nil
    end

    def satisfied_with?(solution, position)
      # return false if there is a customer whom all preferences are not satisfied
      # by current given partially solution
      return false if @customers.any? do |customer|
        customer.preferences.all? do |pref|
          pref.index <= position + 1 && pref.finish != solution[pref.index - 1]
        end
      end

      return true
    end

    def solution_string(solution)
      return 'No solution exists' unless solution
      solution.map(&:to_s).join(' ')
    end
  end
end