module SharedSolverTests
  def test_solve_simple_example
    customers = [
      PaintShop::Customer.parse('1 M 3 G 5 G'),
      PaintShop::Customer.parse('2 G 3 M 4 G'),
      PaintShop::Customer.parse('5 M')
    ]
    solver = @solver.new(paints_count: 5, customers: customers)

    assert_equal('G G G G M', solver.solve)
  end

  def test_solve_no_solution
    customers = [
      PaintShop::Customer.parse('1 M'),
      PaintShop::Customer.parse('1 G')
    ]
    solver = @solver.new(paints_count: 1, customers: customers)

    assert_nil(solver.solve)
  end

  def test_solve_richer_example
    customers = [
      PaintShop::Customer.parse('2 M'),
      PaintShop::Customer.parse('5 G'),
      PaintShop::Customer.parse('1 G'),
      PaintShop::Customer.parse('5 G 1 G 4 M'),
      PaintShop::Customer.parse('3 G'),
      PaintShop::Customer.parse('5 G'),
      PaintShop::Customer.parse('3 G 5 G 1 G'),
      PaintShop::Customer.parse('3 G'),
      PaintShop::Customer.parse('2 M'),
      PaintShop::Customer.parse('5 G 1 G'),
      PaintShop::Customer.parse('2 M'),
      PaintShop::Customer.parse('5 G'),
      PaintShop::Customer.parse('4 M'),
      PaintShop::Customer.parse('5 G 4 M')
    ]
    solver = @solver.new(paints_count: 5, customers: customers)

    assert_equal('G M G M G', solver.solve)
  end

  def test_solve_another_simple_example
    customers = [
      PaintShop::Customer.parse('1 G 2 M'),
      PaintShop::Customer.parse('1 M')
    ]
    solver = @solver.new(paints_count: 2, customers: customers)

    assert_equal('M M', solver.solve)
  end

  def test_solve_for_single_customer
    [PaintShop::Customer.parse('1 M'), PaintShop::Customer.parse('1 G')].each do |customer|
      solver = @solver.new(paints_count: 1, customers: [customer])

      assert_equal(customer.preferences.first.finish.to_s, solver.solve)
    end
  end
end