import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Logger {

    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    	pointcut success() : call(* moneyMake*(..) );
    	after() : success() {
    		if(!file.exists()) {
    			try {
    			file.createNewFile();
    		} catch (IOException ex) {ex.printStackTrace();}
    	} else {
    		try {
    			FileWriter fw =new FileWriter(file, true);
    			fw.append("**** Usuario creado ****");
    			fw.append((char)cal.AM_PM);
    			fw.close();
    		} catch(IOException ex) {ex.printStackTrace();}
    	}
    }
    
}