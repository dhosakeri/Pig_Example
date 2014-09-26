
/* Script counts the number of occurence of each word in a text 
*    sample input :  hello how are you hello how are you 
*    sample output:  hello 2
*					 how 2
*					 are 2
*					 you 2
*/

A = LOAD '/pig_example/wordcount_input' AS (f1:chararray);
B = FOREACH A GENERATE flatten(TOKENIZE(f1)) as word;
C = GROUP B BY word;
D = FOREACH C GENERATE COUNT(B), group;
STORE D INTO '/pig_example/wordcount_output';
