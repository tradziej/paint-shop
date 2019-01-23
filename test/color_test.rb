require 'test_helper'
require 'color'

class ColorTest < Minitest::Test
  def test_color_eqaulity
    color = PaintShop::Color.new(index: 1, finish: :G)
    same_color = PaintShop::Color.new(index: 1, finish: :G)

    refute(color.object_id == same_color.object_id)
    assert(color == same_color)
    assert(color <= same_color)
    assert(color >= same_color)
    refute(color < same_color)
    refute(color > same_color)
  end

  def test_color_unequality
    gloss = PaintShop::Color.new(index: 1, finish: :G)
    matte = PaintShop::Color.new(index: 1, finish: :M)

    refute(gloss == matte)
    assert(gloss <= matte)
    refute(gloss >= matte)
    assert(gloss < matte)
    refute(gloss > matte)
  end

  def test_color_sorting
    gloss = PaintShop::Color.new(index: 1, finish: :G)
    matte = PaintShop::Color.new(index: 1, finish: :M)
    other_gloss = PaintShop::Color.new(index: 2, finish: :G)

    colors = [other_gloss, gloss, matte]
    assert_equal([gloss, matte, other_gloss], colors.sort)
  end
end