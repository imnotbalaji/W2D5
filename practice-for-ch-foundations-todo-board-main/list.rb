require_relative "./item.rb"

class List
    attr_accessor :label

    def initialize (label)
        @label = label
        @items = []
    end 

    def add_item(title,deadline,description="")
        item = Item.new(title,deadline,description)
        if item 
            @items << item 
            return true 
        else 
            return false
        end 
    end 
    def size
        return @items.size
    end 
    def valid_index?(index)
       (index >= 0) && (index < @items.size) 
    end 
    def swap(index_1,index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1],@items[index_2] = @items[index_2],@items[index_1]
            return true 
        else 
            return false
        end 
     end 
     def [](index)
        return  @items[index]
    end 
    def priority
        return @items[0]
    end
    def print 
        puts "---------------------".ljust(50)
        puts @label.ljust(5)
        puts "--------------------".ljust(50)
        STDOUT.print "Index".ljust(15)
        STDOUT.print "|"
        STDOUT.print "Item".ljust(15)
        STDOUT.print "|"
        puts "Deadline".ljust(15)
        puts "--------------------".ljust(50)
        @items.each.with_index do |item,index|
            STDOUT.print index.to_s.ljust(15)
            STDOUT.print "|"
            STDOUT.print item.title.ljust(15)
            STDOUT.print "|"
            STDOUT.print item.deadline.ljust(15)
            STDOUT.print "\n"
        end 
        return nil
    end 

    def print_full_item(index)
        if valid_index?(index)
            STDOUT.print "------------------"
            STDOUT.print "\n"
            STDOUT.print @items[index].title.ljust(15)
            STDOUT.print @items[index].deadline 
            STDOUT.print "\n"
            STDOUT.print @items[index].description
            STDOUT.print "\n"
            STDOUT.print "------------------"
        else 
            return false 
        end 
    end 
    def print_priority
        print_full_item(0)
    end 
    def up(index,amount=1)
        if valid_index?(index)
            i = 0 
            while (i < amount) && (i != index)
                swap(index-i,index-i-1)
                i+=1
            end 
            return true 
        else 
            return false 
        end 
    end 
    def down(index,amount=1)
        if valid_index?(index)
            i = 0 
            while (i < amount) && (index + i != @items.size)
                swap(index+i,index+i+1)
                i+=1
            end 
            return true 
        else 
            return false 
        end 
    end 
    def sort_by_date!
        @items.sort_by! {|item| item.deadline} 
    end 
end 