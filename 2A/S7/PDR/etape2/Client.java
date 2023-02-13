import java.rmi.*;
import java.rmi.server.UnicastRemoteObject;
import java.rmi.registry.*;
import java.lang.reflect.Constructor;
import java.net.*;
import java.util.*;

public class Client extends UnicastRemoteObject implements Client_itf {

	private static Server_itf server;
	private static Client_itf client;
	protected static HashMap<Integer,SharedObject> Objects;

	public Client() throws RemoteException {
		super();		
	}


////////////////////////////////////////////////////
//         Interface to be used by applications
////////////////////////////////////////////////////

	// initialization of the client layer
	public static void init() {
		try {
			server = (Server_itf)Naming.lookup("//localhost"+"/Server");
			client = new Client();
			Objects = new HashMap<Integer,SharedObject>();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// lookup in the name server
	public static SharedObject lookup(String name) {
		SharedObject so = null;
		try {
			int id = server.lookup(name);
			if (id != -1) {
				// On récupère l'objet
                Object obj = null;
                try{
                   obj = server.lock_read(id,client);
                // On récupère le stub.class
                }catch(RemoteException e){
                	e.printStackTrace();
                }
                String className = obj.getClass().getName();
				//L'objet est déjà enregistré
                Class stub = Class.forName(className + "_stub");
                Constructor constr = stub.getConstructor(new Class[] { int.class, Object.class});
                so = (SharedObject)constr.newInstance(new Object[] {id, obj});
				//so.setId(id);
				Objects.put(id,so);
				System.out.println("SharedObject ajouté " + id);						
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return so;
	}		
	
	// binding in the name server
	public static void register(String name, SharedObject_itf so) {
		try {
			server.register(name, ((SharedObject)so).getId());
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}

	// creation of a shared object
	public static SharedObject create(Object o) {
		SharedObject so = null;
		try {
			int id = server.create(o);
			// Création d'une instance de la classe stub
			Class c = o.getClass();
			String ClassName = o.getClass().getName();
			Class stub = Class.forName(ClassName+"_stub");
			Constructor constr = stub.getConstructor(new Class[] { int.class, Object.class});
			//Stockage du sharedObject dans la collection
			so = (SharedObject)constr.newInstance(new Object[] {id, o});
			//so.setId(id);
			Objects.put(id,so);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return so;
	}
	
/////////////////////////////////////////////////////////////
//    Interface to be used by the consistency protocol
////////////////////////////////////////////////////////////

	// request a read lock from the server
	public static Object lock_read(int id) {
		System.out.println("Appel à lock_read sur le Client");
		Object obj = null;
		try {
			obj = server.lock_read(id, client);
			if (obj == null){
				System.out.println("Null for server.lock_read");
			}
			SharedObject so = Objects.get(id);
			so.object = obj;
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return obj;
	}

	// request a write lock from the server
	public static Object lock_write (int id) {
		System.out.println("Appel à lock_write sur le Client");
		Object obj = null;
		try {
			obj = Client.server.lock_write(id, client);
			SharedObject so = Objects.get(id);
			so.object = obj;			
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return obj;
	}

	// receive a lock reduction request from the server
	public Object reduce_lock(int id) throws java.rmi.RemoteException {
		SharedObject so = Objects.get(id);
		Object obj = so.reduce_lock();
		return obj;
	}


	// receive a reader invalidation request from the server
	public void invalidate_reader(int id) throws java.rmi.RemoteException {
		SharedObject so = Client.Objects.get(id);
		so.invalidate_reader();
	}


	// receive a writer invalidation request from the server
	public Object invalidate_writer(int id) throws java.rmi.RemoteException {
		SharedObject so = Client.Objects.get(id);
		return so.invalidate_writer();
	}
}
