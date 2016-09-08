#Mazes
Except walls at 4 directions,the true maze is inside.  
So the size of n,m should be bigger than 2,or it would never have solutions.
I mean I define an example of 4*4 maze as below:  
1111  
1001  
1001  
1111  

maze_class.rb is the core part.  
mazes.rb performs some implementations of maze_class.rb.  
You can see the output of 5 examples 9*9 mazes and 5 examples of 10*10 mazes in maze_test.txt.  

If you want to test more mazes,just go and change the value of n,m in mazes.rb   
