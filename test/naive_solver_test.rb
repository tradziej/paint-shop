require 'test_helper'
require 'naive_solver'

class NaiveSolverTest < Minitest::Test
  include SharedSolverTests

  def setup
    @solver = PaintShop::NaiveSolver
  end
end