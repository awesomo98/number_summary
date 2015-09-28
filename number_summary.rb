# @authors Sam Allen <allensam0@gmail.com>, Bilal Reza <bilalreza@gmail.com>
class NumberSummary
	
	class << self

		def max(array)
			array.max
		end

		def min(array)
			array.min
		end

		def mean(array)
			sum = 0
			array.each_with_index do |element, i|
				sum += array[i]
			end
			sum.to_f / array.length
		end

		def median(array)
			if array.length % 2 == 0
				first_middle = array.length / 2

				second_middle = first_middle + 1

				mean([first_middle, second_middle])

			else
				(((array.length+1) / 2).to_f).ceil
			end
		end

		def q1(array)

			if array.length % 2 == 0
				mean(array[0..((array.length / 2)-1)])
			else
				mean(array[0..((((array.length-1) / 2)-1).to_f).ceil])
			end
		end

		def q2(array)
			if array.length % 2 == 0
				mean(array[(array.length / 2)..array.length-1])
			else
				mean(array[second_half(array)..array.length-1])
			end
		end


		def mode(array)
			count = 0
			array.each do |n|
				min = array.min
				comparison = array.count(min)

				if count < comparison
					count = comparison 
				end
				array.delete(min)
			end
			
			return count

		end


		private
			def second_half(arr)
				(((arr.length-1) / 2)+1).to_f
			end

	end

end