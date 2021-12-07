class TicketsController < ApplicationController
  COL_LIMITS = [
  	{ start_val: 1, end_val: 9 },
  	{ start_val: 10, end_val: 19 },
  	{ start_val: 20, end_val: 29 },
  	{ start_val: 30, end_val: 39 },
  	{ start_val: 40, end_val: 49 },
  	{ start_val: 50, end_val: 59 },
  	{ start_val: 60, end_val: 69 },
  	{ start_val: 70, end_val: 79 },
  	{ start_val: 80, end_val: 90 }
  ]

  NUM_OF_ROWS = 3

  def generate
  	@ticket_grid = [[], [], []]
  	blank_columns = [[], [], []]
  	NUM_OF_ROWS.times do |row_num|
  		num_of_blank_cols = 0
  		while num_of_blank_cols < 4
  			random_num = rand(0..8)
  			unless blank_columns[row_num].include?(random_num)
  				blank_columns[row_num] << random_num
  				num_of_blank_cols += 1
  			end
  		end
  	end

  	COL_LIMITS.size.times do |column_num|
  		start_val = COL_LIMITS[column_num][:start_val]
  		end_val = COL_LIMITS[column_num][:end_val]

  		NUM_OF_ROWS.times do |row_num|
  			if blank_columns[row_num].include?(column_num)
  				@ticket_grid[row_num][column_num] = ' '
  			else
  				other_column_vals = NUM_OF_ROWS.times.collect { |r| @ticket_grid[r][column_num] }
  				random_num = rand(start_val..end_val)
  				while other_column_vals.include?(random_num)
  					random_num = rand(start_val..end_val)
  				end
  				
  				@ticket_grid[row_num][column_num] = random_num 
  			end
  		end
  	end
  end
end
