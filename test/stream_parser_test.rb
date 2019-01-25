require 'test_helper'
require 'stream_parser'

class StreamParserTest < Minitest::Test
  def test_simple_parse
    data = <<~HEREDOC
      1
      1 M
      1 G
    HEREDOC

    parsed = PaintShop::StreamParser.new.parse(data)
    assert_equal(1, parsed[:paints_count])
    assert_equal(2, parsed[:customers].size)
  end

  def test_parse_invalid_paint_number
    data = <<~HEREDOC
      M
      1 M
      1 G
    HEREDOC

    assert_raises(PaintShop::Errors::ParseError) do
      PaintShop::StreamParser.new.parse(data)
    end
  end

  def test_parse_incorrect_paint_number
    data = <<~HEREDOC
      0
      1 M
      1 G
    HEREDOC

    assert_raises(PaintShop::Errors::ParseError) do
      PaintShop::StreamParser.new.parse(data)
    end
  end
end