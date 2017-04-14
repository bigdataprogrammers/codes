#!/bin/bash
#BIGDATAPROGR/\MMERS
#http://bigdataprogrammers.com/
# PROJECT : LEVEL 1 : secondTopperOfSchool 
#To Find Second Toppers of School using Apache Pig.

#HDFS Location of project is :- hdfs://sandbox.hortonworks.com:8020/user/root/bdp/projects/secondTopperOfSchool
#Local Location of Project is :- /root/local_bdp/projects/level1/secondTopperOfSchool
#####################################################################################################################################################################


# Deployment Script of  secondTopperOfSchool.

#To set Intial Directories.(change these two locations as per your environment)
export hdfsLocation=hdfs://sandbox.hortonworks.com:8020/user/root/bdp/projects/secondTopperOfSchool
export localLocation=/root/local_bdp/projects/level1/secondTopperOfSchool

echo "Starting The Application....."
# Create hdfs directory for the project
echo "Creating Hdfs directory...."
hadoop fs -mkdir $hdfsLocation

#To Create input location of files in hdfs.
export inputLocation=$hdfsLocation/ip
hadoop fs -mkdir $inputLocation

#Put input files into Hdfs location
echo "Transferring input files to hdfs location..."
hadoop fs -put $localLocation/input_files/* $inputLocation/

#call Pig Script which will calculate second toppers and store the results in to output hdfs directory.
export outputLocation=$hdfsLocation/op

echo "Calculating second topper of all class...."
pig -f $localLocation/calToppers.pig -param inputLocation=$inputLocation -param outputLocation=$outputLocation

# Create a hive layer on top of output Data.

echo "storing results in to hive table ..."
hive -f "$localLocation/SecToppers.hql" -hiveconf outputLocation=$outputLocation


echo "please view results in SecToppers table of hive."
echo "Process Completed."
echo "Done:BIGDATAPROGR/\MMERS"
