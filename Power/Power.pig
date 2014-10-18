register '/home/cloudera/Desktop/Pig_Practice_example/Power/power.jar';
A = LOAD 'input_files/power_input' USING PigStorage() AS(x:chararray);
B= FOREACH A GENERATE x,power(x);
STORE B INTO 'output/power_output';
