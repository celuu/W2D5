class Item

    def self.valid_date?(str)
        parts = str.split("-").map(&:to_i)
        year, month, day = parts
        return false if str.length != 10 
        return false if !str[0..3].to_i.is_a? Numeric
        return false if str[4] != "-"
        return false if str[7] != "-" 
        return false if !str[5..6].to_i.is_a? Numeric
        return false if !str[8..9].to_i.is_a? Numeric
        return false if !(0..12).include?(month)
        return false if !(0..31).include?(day)
            
        true
    end

    def initialize(title, deadline, description)
        if !Item.valid_date?(deadline)
            raise "the date is not valid"
        end

        @title = title
        @deadline = deadline
        @description = description
    end

    def title
        @title
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline
        @deadline
    end

    def deadline=(new_deadline)
        @deadline = new_deadline
    end

    def description
        @description
    end

    def description=(new_description)
        @description = new_description
    end


end
