require_relative "./list.rb"
class ToDoBoard
    def initialize(label)
        @list = List.new(label)
    end 
    def get_command
        p "Enter a command"
        cmd, *args = gets.chomp.split(" ")
        case cmd 
        when "mktodo"
            @list.add_item(*args)
            return true
        when "up"
            args = args.map! {|ele| ele.to_i}
            @list.up(*args)
            return true
        when "down"
            args = args.map! {|ele| ele.to_i}
            @list.down(*args)
            return true
        when "swap" 
            args = args.map! {|ele| ele.to_i}
            @list.swap(*args)
            return true
        when "sort" 
            @list.sort_by_date!
            return true
        when "priority"
            @list.print_priority
            return true
        when "print" 
            if args == []
                @list.print
            else 
                args = args.map! {|ele| ele.to_i}                
                @list.print_full_item(*args)
            end 
            return true
        when "quit" 
            return false 
        else 
            print "Sorry command is not reecognized "
            return true 
        end 
    end 
    
    def run
        while get_command
        end 
    end 
end 