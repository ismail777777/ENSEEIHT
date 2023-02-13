import java.net.*;
import java.rmi.*;
import java.rmi.server.*;
import java.rmi.registry.*;
import java.util.*;

public class Server extends UnicastRemoteObject implements Server_itf {

	private HashMap<Integer,ServerObject> Objects;
	private HashMap<String,Integer> nameMap;
	private int count; // indique le nombre d'objets créés
	
		
	public Server() throws RemoteException {
		super();
		this.Objects = new HashMap<Integer,ServerObject>();
		this.nameMap = new HashMap<String,Integer>();
		this.count = 0;
	}
	
	//Get the indice of the object from its name
	public int lookup(String name) {
		if (nameMap.containsKey(name)) {
			return nameMap.get(name);
		} else {
			return -1;
		}
	}

	//association of the ID to the name
	public void register(String name, int id) {
		System.out.println("Registering object "+name+",#"+id);
		this.nameMap.put(name,id);
		//On révéille les threads qui attendent la création d'objet
		synchronized(this){
			notify();
		}

	}
	
	//we create a new ServerObject with a unique  ID
	public int create(Object o) {
		int id;
		synchronized (this) {
			count += 1;
			id = count;
		}
		ServerObject srvObj = new ServerObject(id,o);
		this.Objects.put(id,srvObj);
		return id;
	}
	
	public Object lock_read(int id, Client_itf client) {
		System.out.println("Appel à lock_read sur " + id);
		ServerObject srvObj = Objects.get(id);
		return srvObj.lock_read(client);
	}
	
	public Object lock_write(int id, Client_itf client) {
		System.out.println("Appel à lock_write sur " + id);
		ServerObject srvObj = Objects.get(id);
		return srvObj.lock_write(client);
	}
	
	
	 public static void main(String args[]) {
	    try {
	    	Registry registry = LocateRegistry.createRegistry(1099);
	    	System.out.println("Java RMI registry launched on port 1099");
			Server server = new Server();
			String hostname = InetAddress.getLocalHost().getHostName();
			Naming.rebind("//"+hostname+"/Server", server);
			System.out.println("Server listening on "+hostname+"...");
		} catch (Exception ex) {
	    		ex.printStackTrace();
	    	}
	    }

}
