module PaintShop
  class Solver
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
      # override by specific solver
      return false
    end

   private
    def solution_string(solution)
      return nil unless solution
      solution.join(' ')
    end
  end
end