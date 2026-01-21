# independence_test
Here is the code for the independence test between two vectors X and Y.

1- The code as is works when using the Manhattan distance for X and Y.

2- If you want to use the test with other distances, you need to make three changes to the code. The first and third time "Manhattan" appears in the code, you must use the distance you want to use for X, and the second time "Manhattan" appears, you must use the distance you want to use for Y.

3- The code can become very slow for sample values ​​greater than or equal to 100.
4- The code as it is works when X and Y have dimensions greater than or equal to 2.
5- If X is one-dimensional, treat it as a matrix of n rows and 2 columns; the first column contains the data for X, and the second column contains zeros.
