module PaintShop
  # Namespace used to encapsulate all the internal errors
  module Errors
    # Base class for all the internal errors
    BaseError = Class.new(StandardError)

    # Raised when can't parse
    ParseError = Class.new(BaseError)
  end
end