require 'general_bactracking_solver'

module PaintShop
  class BacktrackingSolver
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

    def solution_string(solution)
      return 'No solution exists' unless solution
      solution.map(&:to_s).join(' ')
    end
  end
end