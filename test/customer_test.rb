require 'test_helper'
require 'customer'

class CustomerTest < Minitest::Test
  def test_parse_empty_string
    assert_raises(PaintShop::Errors::ParseError) do
      PaintShop::Customer.parse(nil)
    end
  end

  def test_parse_from_string
    input = "1 M 3 G 5 G"
    customer = PaintShop::Customer.parse(input)
    refute_empty(customer.preferences)
  end

  def test_paint_eqaulity
    customer = PaintShop::Customer.parse('1 M')
    same_customer = PaintShop::Customer.parse('1 M')

    refute(customer.object_id == same_customer.object_id)
    assert(customer == same_customer)
    assert(customer <= same_customer)
    assert(customer >= same_customer)
    refute(customer < same_customer)
    refute(customer > same_customer)
  end

  def test_paint_unequality
    two_paint_pref_customer = PaintShop::Customer.parse('1 M 2 G')
    one_paint_pref_customer = PaintShop::Customer.parse('1 M')

    refute(two_paint_pref_customer == one_paint_pref_customer)
    assert(two_paint_pref_customer >= one_paint_pref_customer)
    refute(two_paint_pref_customer <= one_paint_pref_customer)
    assert(two_paint_pref_customer > one_paint_pref_customer)
    refute(two_paint_pref_customer < one_paint_pref_customer)
  end

  def test_paint_sorting
    two_paint_pref_customer = PaintShop::Customer.parse('1 M 2 G')
    one_paint_pref_customer = PaintShop::Customer.parse('1 M')
    other_one_paint_pref_customer = PaintShop::Customer.parse('1 M')
    three_paint_pref_customer = PaintShop::Customer.parse('1 M 3 G 5 G')

    customers = [
      two_paint_pref_customer,
      one_paint_pref_customer,
      three_paint_pref_customer,
      other_one_paint_pref_customer
    ]
    expected = [
      one_paint_pref_customer,
      other_one_paint_pref_customer,
      two_paint_pref_customer,
      three_paint_pref_customer
    ]
    assert_equal(expected, customers.sort)
  end

  def test_satisfied_with_solution
    customer = PaintShop::Customer.parse('1 M 3 G 5 G')

    assert(customer.satisfied_with?([:G, :G, :G, :G, :M]))
    refute(customer.satisfied_with?([:G, :M, :M, :M, :M]))
  end
end