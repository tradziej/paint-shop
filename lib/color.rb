module PaintShop
  class Color
    attr_reader :index, :finish

    def initialize(index:, finish: :G)
      raise 'Index can\'t be nil' if index.nil?
      raise 'Index must be Integer' unless index.is_a?(Integer)
      raise 'Index must be greater than 1' if index < 1
      @index = index

      raise 'Finish can\'t be nil' if finish.nil?
      raise 'Finish must be Symbol' unless finish.is_a?(Symbol)
      raise 'Finish can be :G or :M only' unless %i(G M).include?(finish)
      @finish = finish
    end
  end
end