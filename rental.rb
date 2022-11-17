class Rental
    attr_accessor :date :book

    def initialize (date)
        @date = date
        book.rentals << self unless book.rentals.include?(self)
    end


end
