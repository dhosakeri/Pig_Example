/* script will output the list of student who are passed in exam
*  There are 2 input file student which contains the student name and roll no 
*  second file results contains roll no and result(pass or fail)
*  Sample input1  raj 3            
*                 hisham 2
*  Sample input2  2 fail
*				  3 pass
*  Sample output  raj pass
*/

 


A = LOAD '/pig_example/student' USING PigStorage(' ')AS (a1:chararray,a2:int);
B=  LOAD '/pig_example/results' USING PigStorage('\t')AS (b1:int,b2:chararray);
C= JOIN A BY a2,B BY b1;
D= FOREACH C GENERATE a1,b2;
E= FILTER D BY b2 matches 'pass';
STORE E INTO '/pig_example/student_result_output';
