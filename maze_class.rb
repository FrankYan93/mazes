class Maze
    def initialize(n, m)
        @n = n - 3# max row index of inner maze
        @m = m - 3# max column index of inner maze
        @maze = []# inner maze without walls
        @a = [-1, 0] # left
        @s = [0, 1] # down
        @d = [1, 0] # right
        @w = [0, -1] # up
        @visitedSet = Hash.new(-1) # current number => prev
        @queue=[]
    end
    def load
        for i in 0..@n
            @maze << []
            (@m+1).times do
                @maze[i] << 0
            end
        end
    end
    def redesign
        for i in 0..@n
            for j in 0..@m
                @maze[i][j] = rand(2)
            end
        end
    end
    def display(testFile)
        line = '1' * (@n + 3)
        testFile.puts line
        for i in 0..@n
            testFile.print '1'
            for j in 0..@m
                testFile.print(@maze[i][j])
            end
            testFile.print '1'
            testFile.puts ''
        end
        testFile.puts line
    end
    attr_accessor:maze
    attr_accessor:a
    attr_accessor:s
    attr_accessor:d
    attr_accessor:w
    attr_accessor:n
    attr_accessor:m
    def solve(begX, begY, endX, endY)
        solve_inside(begX - 2, begY - 2, endX - 2, endY - 2)
    end

    def checkNext(begX, begY, endX, endY)
      return false if (begX > @n) || (begX < 0) || (begY > @m) || (begY < 0)
      return false if @maze[begX][begY] > 0 || @maze[endX][endY] > 0
      return false if @visitedSet[begX * @n + begY]!=-1
      true
    end

    def addNewPosition(t,a,begX, begY, endX, endY)
      if checkNext(begX + a[0], begY + a[1], endX, endY)
        nextPosition=(begX + a[0]) * @n + begY + a[1]
        @queue<<nextPosition
        @visitedSet[nextPosition]=t
      end
    end
    def solve_inside(begX, begY, endX, endY) # BFS

        t = begX * @n + begY
        return t if (begX == endX) && (begY = endY)

        addNewPosition(t,@a,begX, begY, endX, endY)

        addNewPosition(t,@s,begX, begY, endX, endY)

        addNewPosition(t,@d,begX, begY, endX, endY)

        addNewPosition(t,@w,begX, begY, endX, endY)

        if @queue.length>0
          t=@queue.shift
          begX=t / @m
          begY=t % @m
          return solve_inside(begX, begY, endX, endY)
        else
          return -1
        end
    end


    def trace(begX, begY, endX, endY, testFile)

        return 'Maze#trace:No way out!' if @maze[begX-2][begY-2] > 0 || @maze[endX-2][endY-2] > 0

        @queue<<((begX-2) * @n + (begY-2))
        @visitedSet[(begX-2) * @n + (begY-2)]=-2

        solve(begX, begY, endX, endY)
        return 'Maze#trace:No way out!' if (t=@visitedSet[(endX-2) * @n + (endY-2)]) < 0
        testFile.print "[#{endX},#{endY}]"
        while t>-1 do

          testFile.print '<-'
          testFile.print "[#{(t / @m)+2},#{(t % @n)+2}]"
          t=@visitedSet[t]
        end
        testFile.puts ''
        'Maze#trace:This is one of the ways to go!'
    end
end
