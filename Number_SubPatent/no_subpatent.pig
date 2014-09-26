/*script calculate the no of subpatent in a patent list 
*  Sample input : 1 1.232
*				  1 1.45
*`				  1 1.153
*                 2 2.59
*				  2 2.111
*  Sample output :  1 3
*                   2 2
*/


A = LOAD '/pig_example/no_subpatents_input' USING PigStorage(' ') AS(patent:int,subpatent:float);
B = GROUP A BY patent;
C = FOREACH B GENERATE group,COUNT(A.subpatent);
STORE C INTO '/pig_example/no_subpatents_output';
