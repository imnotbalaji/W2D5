require_relative "./list.rb"
class ToDoBoard
    attr_accessor :lists
    def initialize
        @lists = {}
    end 
    def get_command
        p "Enter a command"
        cmd, *args = gets.chomp.split(" ")
        case cmd 
        when "mklist"
             @lists[*args] = List.new(*args)
             return true
        when "ls" 
            @lists.each_key  {|key| p key}
            return true
        when "mktodo"
            list_label = args.shift
            @lists[list_label].add_item(*args)
            return true
        when "up"
            list_label = args.shift
            args = args.map! {|ele| ele.to_i}
            @lists[list_label].up(*args)
            return true
        when "down"
            list_label = args.shift
            args = args.map! {|ele| ele.to_i}
            @lists[list_label].down(*args)
            return true
        when "swap" 
            list_label = args.shift
            args = args.map! {|ele| ele.to_i}
            @lists[list_label].swap(*args)
            return true
        when "sort" 
            list_label = args.shift
            @lists[list_label].sort_by_date!
            return true
        when "priority"
            list_label = args.shift
            @lists[list_label].print_priority
            return true
        when "print" 
            list_label = args.shift
            if args == []
                @lists[list_label].print
            else 
                args = args.map! {|ele| ele.to_i}                
                @lists[list_label].print_full_item(*args)
            end 
            return true
        when "toggle"
            list_label = args.shift
            args = args.map! {|ele| ele.to_i}                
            @lists[list_label].toggle_item(*args)
            return true
        when "rm"
            list_label = args.shift
            args = args.map! {|ele| ele.to_i}                
            @lists[list_label].remove_item(*args)
            return true
        when "purge"
            list_label = args.shift
            @lists[list_label].purge
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

my_board = ToDoBoard.new
my_board.run