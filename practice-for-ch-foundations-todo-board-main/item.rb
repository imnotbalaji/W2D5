class Item
    def self.valid_date?(date_string)
        year = date_string[0..3].to_i
        month = date_string[5..6].to_i
        date = date_string[8..9].to_i
        return false if !(1..12).include?(month) || !(1..31).include?(month)
        return true              
    end 
    attr_accessor :title, :description
    attr_reader :deadline

    def initialize(title,deadline,description)
        if !Item.valid_date?(deadline)
            raise RuntimeError.new("Invalid date for deadline")
        end 
        @title = title 
        @deadline = deadline
        @description = description
    end 

    def deadline=(deadline)
        if !Item.valid_date?(deadline)
            raise RuntimeError.new("Invalid date fo deadline")
        end 
        @deadline = deadline
    end 
    

end 