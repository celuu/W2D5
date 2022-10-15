require_relative 'item.rb'


class List

    LINE_WIDTH = 42
    INDEX_COL_WIDTH = 5
    ITEM_COL_WIDTH = 20
    DEADLINE_COL_WIDTH = 10

    def initialize(label)
        @list = label
        @items = []
    end

    def label
        @list
    end

    def label=(new_label)
        @list = new_label
    end

    def add_item(title, deadline, description = "")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        end
        false
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index < 0
        return false if index > self.size
        true
    end

    def swap(idx1, idx2)
        if valid_index?(idx1) && valid_index?(idx2)
            @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
            return true
        end
        false
    end

    def [](index)
        if !valid_index?(index)
            return nil  
        end
        @items[index]
    end

    def priority
        return @items[0]
    end

    def print
        puts "-" * LINE_WIDTH
        puts " " * 16 + self.label.upcase
        puts "-" * LINE_WIDTH
        puts "#{'Index'.ljust(INDEX_COL_WIDTH)} | #{'Item'.ljust(ITEM_COL_WIDTH)} | #{'Deadline'.ljust(DEADLINE_COL_WIDTH)}"
        puts "-" * LINE_WIDTH
        @items.each_with_index do |item, i|
            puts "#{i.to_s.ljust(INDEX_COL_WIDTH)} | #{item.title.ljust(ITEM_COL_WIDTH)} | #{item.deadline.ljust(DEADLINE_COL_WIDTH)}"
        end
        puts "-" * LINE_WIDTH
    end

    def print_full_item(index)
        puts "-" * LINE_WIDTH
        puts "#{'Item'.ljust(ITEM_COL_WIDTH)} | #{'Deadline'.ljust(DEADLINE_COL_WIDTH)}"
        puts "-" * LINE_WIDTH
        puts "#{@items[index].title.to_s.ljust(ITEM_COL_WIDTH)} | #{@items[index].deadline.ljust(DEADLINE_COL_WIDTH)}"
        puts "-" * LINE_WIDTH
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount = 1)
        if (index-amount) < 0
            checked_num = 0
        else
            checked_num = index - amount
        end
        if !valid_index?(checked_num)
            return false
        end
        @items[index], @items[checked_num] = @items[checked_num], @items[index]
        true
    end

    def down(index, amount = 1)
        if (index + amount) > self.size
            checked_num = -1
        else
            checked_num = index + amount
        end
        if checked_num != -1
            if !valid_index?(checked_num)
                return false
            end
        end
        @items[index], @items[checked_num] = @items[checked_num], @items[index]
        true
    end

    def sort_by_date!
        @items.sort_by! do |item|
            item.deadline
        end
    end


end