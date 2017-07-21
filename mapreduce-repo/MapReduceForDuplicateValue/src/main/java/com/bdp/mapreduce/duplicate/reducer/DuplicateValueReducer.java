package com.bdp.mapreduce.duplicate.reducer;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

import com.google.common.collect.Iterables;

/*
 * This reducer will get mapper data as input and return only key that is duplicate value.
 * 
 */
public class DuplicateValueReducer 
			extends Reducer<Text, IntWritable, Text, NullWritable>{

	@Override
	protected void reduce(Text key, Iterable<IntWritable> values,
			Reducer<Text, IntWritable, Text, NullWritable>.Context context)
			throws IOException, InterruptedException {
		// TODO Auto-generated method stub
		//Check if the key has duplicate value
		if (Iterables.size(values) > 1) {
			context.write(key, NullWritable.get());
		}
			
	}
}
