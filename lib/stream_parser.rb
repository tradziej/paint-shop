require_relative 'customer'
require_relative 'errors'

module PaintShop
  class StreamParser
    def parse(data)
      lines = data.split("\n")

      unless is_integer?(lines[0])
        raise PaintShop::Errors::ParseError, 'Paints number must be Integer'
      end

      paints_count = lines[0].to_i

      if paints_count < 1
        raise PaintShop::Errors::ParseError, 'Paints number must be greater than 1'
      end

      customers = get_customers_from(lines.drop(1))

      {
        :paints_count => paints_count,
        :customers => customers
      }
    end

   private
    def get_customers_from(lines)
      lines.map { |line| PaintShop::Customer.parse(line) }
    end

    def is_integer?(string)
      string.to_i.to_s == string
    end
  end
end