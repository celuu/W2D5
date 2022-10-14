class Flight

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def passengers
        @passengers
    end

    def full?
        if @passengers.length < @capacity
            return false
        end
        true
    end

    def board_passenger(passenger_instance)
        if passenger_instance.has_flight?(@flight_number) && !self.full?
            @passengers << passenger_instance
        end
    end

    def list_passengers
        new_arr = []
        @passengers.each do |passenger|
            new_arr << passenger.name
        end
        new_arr
    end

    def [](index_num)
        @passengers[index_num]
    end

    def <<(passenger_instance)
        self.board_passenger(passenger_instance)
    end
end