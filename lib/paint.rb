module PaintShop
  class Paint
    include Comparable

    attr_reader :number, :finish

    def initialize(number:, finish: :G)
      raise 'Paint number can\'t be nil' if number.nil?
      raise 'Paint number must be Integer' unless number.is_a?(Integer)
      raise 'Paint number must be greater than 1' if number < 1
      @number = number

      raise 'Finish can\'t be nil' if finish.nil?
      raise 'Finish must be Symbol' unless finish.is_a?(Symbol)
      raise 'Finish can be :G or :M only' unless %i(G M).include?(finish)
      @finish = finish
    end

    def <=>(other)
      unless other.is_a?(::PaintShop::Paint)
        raise TypeError, "Can't compare #{other.class} with PaintShop::Paint"
      end

      [number, finish] <=> [other.number, other.finish]
    end
  end
end