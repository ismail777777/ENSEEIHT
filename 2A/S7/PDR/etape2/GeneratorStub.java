import java.io.FileWriter;
import java.io.PrintWriter;
import java.lang.reflect.Method;

public class GeneratorStub {
	
	public static void create_Stub(String name){
		Class c;
        try {
            c = Class.forName(name);
        } catch (ClassNotFoundException e) {
            System.err.println ("classe "+name+" non trouvée.");
            return;
        }
		String Interface = (String)(name + "_itf");
		String stubName = (String)(name + "_stub");
		PrintWriter pw_stub;
		try {
			pw_stub = new PrintWriter(new FileWriter(stubName + ".java",false));
		} catch (Exception e){
			e.printStackTrace();
			return;
		}
		if (c.isInterface()) {
			String cType = "interface";
			pw_stub.println("public interface "+ stubName + " extends SharedObject " +
					"implements " + Interface + ", java.io.Serializable { \n");
        } else {
        	String cType = "class";
        	pw_stub.println("public class "+ stubName + " extends SharedObject " +
    				"implements " + Interface + ", java.io.Serializable { \n");
        }
		// Constructeur
		pw_stub.println("public "+stubName+"(int id, Object o) { \n " + "	super(id); \n" + "} \n");
		//méthodes
		Method[] methodes = c.getMethods();
		for (int i = 0; i < methodes.length; i++) {
	            Method m = methodes[i];
	            String methodName = m.getName();
	            if (   !methodName.equals("hashCode")
	                && !methodName.equals("equals")
	                && !methodName.equals("notify")
	                && !methodName.equals("getClass")
	                && !methodName.equals("wait")
	                && !methodName.equals("toString")
	                && !methodName.equals("notifyAll")
	                ){
	            	String returnType = m.getReturnType().getName();
	            	Class[] parametres = m.getParameterTypes();
	            	pw_stub.print("\tpublic "+ returnType + " " +methodName
	            			+"(");            
		      
		            for (int k = 0; k < parametres.length; k++) {
		            	
		            	pw_stub.print(parametres[k].getName()+" p"+k);
		            	if (k!=parametres.length-1){
		            		pw_stub.print(",");
		            	}
		            }
		           		            
		            //pour le fichier stub
		            pw_stub.println("){");
		            pw_stub.println("\t\t"+name + " s = (" 
		            		+ name + ")object;");
		            
		            String ret = "";
		            if (!returnType.equals("void")){
		            	ret = "return";
		            }
		            pw_stub.print("\t\t" +
		            		ret+" s."+methodName+"(");
		            
		            for (int j = 0; j < parametres.length; j++) {
		            	pw_stub.print("param"+j);
		            	if (j!=parametres.length-1){
		            		pw_stub.print(",");
		            	} 
		            }
		            
		            pw_stub.print(");");
		            pw_stub.println("\n\t}\n");
		            
	            }
	        }
		pw_stub.println("}");
		pw_stub.close();
	}

	public static void main (String[] args) {
		
		if (args.length != 1) {
            System.err.println("Donnez le nom de la classe ou l'interface.");
            return;
        }
		create_Stub(args[0]);
	}
}
