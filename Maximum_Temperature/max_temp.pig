/* Script calculate the maximum temperature recorded in that particular year 
*   Sample input : 1990 25
*	               1991 20
*				   1990 30
*				   1991 24
*				   1991 90
*				   1990 75
*	Sample Output : 1990 75 
*					1991 90	
*/				

A = LOAD '/pig_example/max_temp_input' USING PigStorage(' ')AS (year:int,temperature:int); 
B = GROUP A BY year;
C = FOREACH B GENERATE group,MAX(A.temperature);
STORE C INTO '/pig_example/max_temp_output';
