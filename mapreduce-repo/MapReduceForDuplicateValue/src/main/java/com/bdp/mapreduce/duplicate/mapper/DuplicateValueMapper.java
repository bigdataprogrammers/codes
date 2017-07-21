package com.bdp.mapreduce.duplicate.mapper;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class DuplicateValueMapper 
		extends Mapper<LongWritable, Text, Text, IntWritable>{

	private static final IntWritable one = new IntWritable(1);
	
	@Override
	protected void map(LongWritable key, Text value,
			Mapper<LongWritable, Text, Text, IntWritable>.Context context)
			throws IOException, InterruptedException {
		// TODO Auto-generated method stub
		//Skipping the header of the input
		if (key.get() == 0 && value.toString().contains("first_name")) {
			return;
		} 
		else {
			String values[] = value.toString().split(",");
			context.write(new Text(values[1]), one); //Writing first_name value as a key
		}
	}
}
