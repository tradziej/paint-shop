require 'test_helper'
require 'backtracking_solver'

class SolverTest < Minitest::Test
  include SharedSolverTests

  def setup
    @solver = PaintShop::BacktrackingSolver
  end
end