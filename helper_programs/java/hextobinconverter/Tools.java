import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStreamReader;


public class Tools {

	private Tools(){}
	
	
	public static void fileHexToBinConverter(String inputFile, String outputFile){
		
		try{
			  FileInputStream fileInputStream = new FileInputStream(inputFile);

			  DataInputStream in = new DataInputStream(fileInputStream);
			  BufferedReader br = new BufferedReader(new InputStreamReader(in));
			  String strLine;
			  
			  
	 
			  FileWriter fileOutputStream = new FileWriter(outputFile);
			  BufferedWriter out = new BufferedWriter(fileOutputStream);
			
  
			  while ((strLine = br.readLine()) != null)   {
				  
				  int i = Integer.parseInt(strLine, 16);
				  String bIn = Integer.toBinaryString(i);
				  
				  int len = bIn.length();
				  String zeroes = "00000000";
				  if (len < 8)
				    bIn = zeroes.substring(0, 8-len).concat(bIn);
				  else
				    bIn = bIn.substring(len - 8);
				 
				  System.out.println(bIn);
				  out.write("ROM_WORD'(\""+bIn +"\"),"+"\n");
			  }
		
			  in.close();
			  out.close();
			  
			  }catch (Exception e){
				  System.err.println("Error: " + e.getMessage());
			  }
		
	}
	

}
