MachineLearning-NumericalMetodes

1 Markov is coming ... (40 points)
1.1 Statement
After obtaining very good grades in his first semester courses (especially in programming and linear algebra), Mihai decided to spend his time solving an interesting problem, aiming to find the most efficient solution.

Being passionate about technology, he bought himself a robot that he can program as he wishes. In his spare time, he also built a small maze to test the robot.

Now, Mihai wants to place the robot somewhere inside the maze and program it so that at each step it chooses the best direction in order to escape. The robot is considered to have escaped if it reaches one of the designated exits of the maze.

Since Mihai is not yet familiar with advanced search algorithms (those are usually studied in the second year), he decided to start with a simpler problem and then implement a basic algorithm as follows:

Given a maze and a starting position, what is the probability that my robot reaches a winning exit if at each step it randomly chooses one of the available directions to move?
Also, how can I use the previously determined probabilities to guide the robot more efficiently through the maze than by using exhaustive search?

1.2 Visual Explanation
Let's suppose the maze is represented as a square matrix, where the starting position of the robot is the top-left corner, with coordinates (1,1). The robot will choose to move to a new cell in the maze that it hasn’t previously visited, and it can move up, down, left, or right — but not diagonally.

For example, from the starting point, the robot might move to cell (2,1), then to (3,1), (4,1), and afterward will choose between the two adjacent cells based on which has the higher probability of leading to a win.

There are two types of exits:

Winning exits – marked in green – these are always on the top or bottom edges of the maze. Exiting through one of them means the robot wins (probability = 1).

Losing exits – marked in red – these are always on the left or right edges of the maze. Exiting through one of these means the robot loses (probability = 0).

Walls may also exist inside the maze and prevent movement between two adjacent cells. For instance, in the figure, the robot cannot go from cell (1,1) to cell (1,2). At any given moment, the robot can have at most 4 options (directions) to move to, and it chooses one randomly with equal probability.

1.3 Theoretical References
To model this situation, we will use Markov chains — probability chains useful in many fields including economics, system reliability, and AI algorithms. Even Google's PageRank is a modified form of a Markov chain.

The basic data structure is a directed graph, where:

Nodes = states

Edges = non-zero probability of transitioning from one state to another.

For any state, the sum of the transition probabilities must equal 1:

![{E1AAC6FF-4C8E-4CA0-A1AC-F05187BBEC79}](https://github.com/user-attachments/assets/2ebd8dd2-dfe2-4097-a418-86f0849bc159)

We will associate each cell in the maze with a unique state. Numbering begins from the top-left corner.

In addition to the maze states, we also define:

WIN state – terminal winning state

LOSE state – terminal losing state

Once these are added, the full Markov chain graph includes all regular cells + WIN + LOSE.

1.3.1 Adjacency Matrix
The adjacency matrix for a directed graph is defined as:

![{576DE7D0-C6F8-416C-9018-6C171C5ADF3B}](https://github.com/user-attachments/assets/e03aea9e-fb91-448c-9b3e-a1e0073c0bed)

The upper-left block of the matrix (excluding WIN/LOSE rows) is symmetric due to bidirectional transitions in the maze.

1.3.2 Link Matrix
A more powerful version of the adjacency matrix is the link matrix, where elements represent transition probabilities:

![{83C13BB9-A04C-4E9F-83F6-6614C2614DDD}](https://github.com/user-attachments/assets/13ed213a-0bfe-4fd7-9998-66bb007ba566)

It is a row-stochastic matrix (each row sums to 1).

1.3.3 System of Linear Equations
We define a probability vector p representing the probability of winning from each state.

Example:

From state 1, the robot can go to state 4 (prob. ½) or to WIN (prob. ½):

![{773C91E6-58B3-4C1B-B6D9-C6E0F8A2221D}](https://github.com/user-attachments/assets/6a19752b-9b90-4908-9c4e-e2299a90aabe)

 
A full system of linear equations is built for all states. It can be written in the form:

p=Gp+c 
This is suitable for the Jacobi iterative method, which converges if the spectral radius ρ(G)<1. For this example, ρ(G)≈0.85192, so Jacobi will converge.

1.3.4 Heuristic Search Algorithm
Since states closer to WIN have higher winning probabilities, we can design a heuristic greedy search based on DFS, using the transition probabilities to guide the search.

Pseudocode:

    procedure heuristic_greedy(start_position, probabilities, adjacency_matrix)
        path ← [start_position]
        visited[start_position] ← True
        while path is not empty do
            position ← last element in path
            if position is WIN then return path
            if no unvisited neighbors then remove last element from path
            neigh ← unvisited neighbor with highest probability to WIN
            visited[neigh] ← True
            path.append(neigh)
        return path
1.3.5 Maze Encoding
The maze is encoded as a matrix with integers (4-bit binary numbers) where each bit represents a wall:

Bit 3 = wall to the North

Bit 2 = wall to the South

Bit 1 = wall to the East

Bit 0 = wall to the West

Note: Walls are bidirectional.

1.4 Requirements
You must implement the following MATLAB functions:

1. function [Labyrinth] = parse_labyrinth(file_path)
Input: a file path to a text file representing the maze

Output: the maze as a matrix with wall encodings

    m n
    l_11 l_12 ... l_1n
    l_21 l_22 ... l_2n
    ...
    l_m1 l_m2 ... l_mn
2. function [Adj] = get_adjacency_matrix(Labyrinth)
Input: encoded matrix from above

Output: adjacency matrix of the Markov graph

3. function [Link] = get_link_matrix(Labyrinth)
Input: encoded maze

Output: link (transition probability) matrix

4. function [G, c] = get_Jacobi_parameters(Link)
Input: link matrix

Output: iteration matrix G and constant vector c for Jacobi method

5. function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
Inputs:

G, c – from above

x0 – initial approximation

tol – tolerance threshold

max_steps – max iterations

Outputs:

solution vector x, final error err, number of steps used

6. function [path] = heuristic_greedy(start_position, probabilities, Adj)
Inputs:

start_position – initial cell index

probabilities – extended vector including WIN/LOSE

Adj – adjacency matrix

Output: list of state indices forming a path to WIN

7. function [decoded_path] = decode_path(path, lines, cols)
Input: list of state indices, number of rows and columns

Output: a matrix of 2 columns, each row = (row, col) of the cell


TBC.....
