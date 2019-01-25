require_relative 'stream_parser'

module PaintShop
  class Parser
    def self.parse(data, type)
      return { paints_count: 0, customers: [] } if data.empty? || type != 'stream'

      PaintShop::StreamParser.new.parse(data)
    end
  end
end