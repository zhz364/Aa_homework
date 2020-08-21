def biggest_f(arr)
    biggest = ""
    arr.each_with_index do |f1,i|
        (i+1...arr.length).each do |j|
            if f1.length > arr[j].length
                biggest = f1
            else
                biggest = arr[j]
            end
        end
    end
    biggest
end
class Array
    def my_quick_sort(&prc)
        prc ||= Proc.new{|a,b| a.length<=>b.length}
        return self if self.length < 2
        p = self[0]
        left = self[1..-1].select{|n| prc.call(n,p) == -1}
        right = self[1..-1].select{|n| prc.call(n,p) != -1}
        left.my_quick_sort(&prc) + [p] + right.my_quick_sort(&prc)
    end 
end 

def faster_f(arr)
    arr.my_quick_sort[-1]
end

def fastest_f(arr)
    big = ""
    (0...arr.length-1).each do |i|
        if arr[i].length > arr[i+1].length
            big = arr[i]
        else
            big = arr[i+1]
        end
    end
    big
end
# p biggest_f(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

# p faster_f(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

# p fastest_f(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

def slow_dance(target, tiles_array)
    count = 0 
    tiles_array.each do |ele|
        if ele == target
            return count
        else
            count +=1
        end
    end
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# p slow_dance("up", tiles_array)

def helper(arr)
    hash = {}
    arr.each_with_index do |ele,i|
        hash[ele] = i 
    end
    hash
end
new_tiles_data_structure = helper(tiles_array)
def fast_dance(key,hash)
    hash[key]
end
# p slow_dance("right-down", tiles_array)
p fast_dance("up", new_tiles_data_structure)

p fast_dance("right-down", new_tiles_data_structure)

