FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def on_squared
  long = nil
  FISH.each do |fish1|
    FISH.each do |fish2|
      long = fish1 if fish1.length > fish2.length
    end
  end
  long
end

def merge_sort (array, &prc)
  return array if array.length <= 1

  mid_idx = array.length / 2
  merge(
    merge_sort(array.take(mid_idx), &prc),
    merge_sort(array.drop(mid_idx), &prc),
    &prc
  )
end

def merge(left, right, &prc)
   merged_array = []
   prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
   until left.empty? || right.empty?
     case prc.call(left.first, right.first)
     when -1
       merged_array << left.shift
     when 0
       merged_array << left.shift
     when 1
       merged_array << right.shift
     end
   end

   merged_array + left + right
 end

def on
  long = ""
  FISH.each do |fish|
    long = fish if fish.length > long.length
  end
  long
end

def slow_dance(tile)
  tiles_array = ["up", "right-up", "right", "right-down", "down",
    "left-down", "left",  "left-up" ]

    tiles_array.each_index { |i| return i if tiles_array[i] == tile }
end

def fast_dance(tile)
  tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right" => 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
  }

  tiles_hash[tile]
end

p slow_dance("up")
p slow_dance("right-down")

p fast_dance("up")
p fast_dance("right-up")
