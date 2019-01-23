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
end