# Mazes [![Code Climate](https://codeclimate.com/github/FrankYan93/mazes/badges/gpa.svg)](https://codeclimate.com/github/FrankYan93/mazes)

# Author
+ **Jiadong Yan**

# Brief Explanation
Except walls at 4 directions,the true maze is inside.  
So the size of n,m should be bigger than 2,or it would never have solutions.
I mean I define an example of **4\*4** maze as below:  
1111  
1001  
1001  
1111  

**maze_class.rb** is the core part.  
**mazes.rb** performs some implementations of **maze_class.rb**.  
You can see the output of 5 examples 9\*9 mazes and 5 examples of 10\*10 mazes in **maze_test.txt**.  

If you want to test more mazes,just go and change the value of n,m in **mazes.rb**   

# An Example Output of a 9*9 maze begin at (3,5),end at (5,5)
Row1: 111111111  
Row2: 101010001  
Row3: 101001001  
Row4: 111100011  
Row5: 110100111  
Row6: 111001101  
Row7: 101110001  
Row8: 110011011  
Row9: 111111111  


**Maze#trace:**  
[5,5]<-[4,5]<-[3,5]
