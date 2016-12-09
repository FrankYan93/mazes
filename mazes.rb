#!/usr/bin/env ruby
require_relative 'maze_class'
require 'byebug'
def test(n,m,begX,begY,endX,endY,file)
  file.puts "It's the test of #{n}*#{m} maze,begin at point(#{begX},#{begY}),end at point(#{endX},#{endY})!!!!"
  maze_test=Maze.new(n,m);
  file.puts "Maze#load:"
  maze_test.load
  maze_test.display(file)
  file.puts ''
  file.puts "Maze#redesign:"
  maze_test.redesign
  maze_test.display(file)

  file.puts "\n\rMaze#trace:"
  file.puts maze_test.trace(begX,begY,endX,endY,file)
end

File.open("maze_test.txt", "w") {|file|
  if file
    5.times{
      test(9,9,3,5,5,5,file)
      file.puts "\n\r"
    }
    5.times{
      test(10,10,5,5,6,7,file)
      file.puts "\n\r"
    }
  else
    puts "Fail to open file!"
  end
}
