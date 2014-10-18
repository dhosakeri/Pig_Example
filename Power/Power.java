import java.io.IOException;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;
import org.apache.pig.impl.util.WrappedIOException;

/* the program calculates the power value of of given inputs 
 * input:  2,3
 * 		   2,-3
 * output: 2,3  8
 *         2,-3  0.125
 *        */

public class power extends EvalFunc<String> {
	
	@SuppressWarnings("deprecation")
	@Override
	public String exec(Tuple input) throws IOException {
			
		/* check if there is input data present */
		if(input==null || input.size()==0)
		return null;
		
		try{
			
			String str=(String)input.get(0);
			String[] line=str.split(",");
			
			float x=Float.parseFloat(line[0]);
			float n =Float.parseFloat(line[1]);
			
			float output=x;
			
			if(n>=0){
				while((n-1)!=0){
					output = x*output;
					n--;
				}
			}
			else{
				n=-n;
				while((n-1)!=0){
						output = x*output;
						n--;
					}
				output=1/output;
			}
				
			
			String ret =String.valueOf(output);
			return ret;	
			
		}catch(Exception e){
			throw WrappedIOException.wrap("caught execption processing input row",e);
			
		}
		
	}

}

