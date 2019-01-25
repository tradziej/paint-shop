require 'test_helper'
require 'paint'

class PaintTest < Minitest::Test
  def test_paint_eqaulity
    paint = PaintShop::Paint.new(number: 1, finish: :G)
    same_paint = PaintShop::Paint.new(number: 1, finish: :G)

    refute(paint.object_id == same_paint.object_id)
    assert(paint == same_paint)
    assert(paint <= same_paint)
    assert(paint >= same_paint)
    refute(paint < same_paint)
    refute(paint > same_paint)
  end

  def test_paint_unequality
    gloss = PaintShop::Paint.new(number: 1, finish: :G)
    matte = PaintShop::Paint.new(number: 1, finish: :M)

    refute(gloss == matte)
    assert(gloss <= matte)
    refute(gloss >= matte)
    assert(gloss < matte)
    refute(gloss > matte)
  end

  def test_paint_sorting
    gloss = PaintShop::Paint.new(number: 1, finish: :G)
    matte = PaintShop::Paint.new(number: 1, finish: :M)
    other_gloss = PaintShop::Paint.new(number: 2, finish: :G)

    paints = [other_gloss, gloss, matte]
    assert_equal([gloss, matte, other_gloss], paints.sort)
  end
end