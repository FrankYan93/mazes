require_relative 'maze_class'

def test(n,m,begX,begY,endX,endY,file)
  file.puts "It's the test of #{n}*#{m} maze,begin at point(#{begX+1},#{begY+1}),end at point(#{endX+1},#{endY+1})!!!!"
  maze_test=Maze.new(n,m);
  file.puts "Maze#load:"
  maze_test.load
  maze_test.display(file)
  file.puts ''
  file.puts "Maze#redesign:"
  maze_test.redesign
  maze_test.display(file)
  file.puts ''
  file.puts "Maze#solve:"
  t=maze_test.solve(begX,begY,endX,endY)
  file.puts t
  file.puts ''
  file.puts "Maze#trace:" if t
  file.puts maze_test.trace(begX,begY,endX,endY,file)
end

File.open("maze_test.txt", "w") {|file|
  if file
    5.times{
      test(9,9,3,3,5,5,file)
      file.puts ''
      file.puts ''
    }
    5.times{
      test(10,10,5,4,6,7,file)
      file.puts ''
      file.puts ''
    }
  else
    puts "Fail to open file!"
  end
}
