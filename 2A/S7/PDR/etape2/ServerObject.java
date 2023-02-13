import java.util.Iterator;
import java.util.Vector;

public class ServerObject {

	private int id;//id du sharedObject
	private Object object;
	private Vector<Client_itf> Clients; //Liste des clients en lecture

	private Client_itf writer;//writer si il y en a
	

	public int state;
	// 0 libre
	// 1 1 lecteur
	// 2 mode écriture

	public ServerObject(int n, Object o) {
		this.id = n;
		this.object = o;
		this.Clients = new Vector<Client_itf>();
		this.writer = null;
	}

	public void addClient(Client_itf c){
		this.Clients.add(c);
	}
	
	public void removeClient(Client_itf c){
		this.Clients.remove(c);
	}
	
	public void setWriter(Client_itf c){
		this.writer = c;
	}
	
	public Client_itf getWriter(){
		return this.writer;
	}
	
	public int getState() {
		return this.state;
	}
	
	public synchronized Object lock_read(Client_itf client){
		System.out.println("Lock_read on serverObject : " + this.id);
		if (this.writer != null) {
			try {
				Object ob = this.writer.reduce_lock(this.id);
				if (ob != null) {
					this.object = ob;
				} 
				this.Clients.add(this.writer);
			} catch (Exception e){
				e.printStackTrace();
			}
		} else {
			System.out.println("No writer");
		}		
		this.writer=null;
		System.out.println("Adding reader");
		this.Clients.add(client);
		return this.object;
	}

	public synchronized Object lock_write(Client_itf client){
		System.out.println("Lock_write on serverObject : " + this.id);
		if (this.writer != null){
			try {
				System.out.println("Invalidating writer");
				Object obj = this.writer.invalidate_writer(this.id);
				if (obj != null) {
					this.object=obj;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("No writer");
		}
		this.writer = null;
		Iterator<Client_itf> iterator = this.Clients.iterator();
		while (iterator.hasNext()){
			try {
				System.out.println("Invalidating reader");
				Client_itf cl = iterator.next();
				if (!cl.equals(client)) {
					cl.invalidate_reader(this.id);
				}
			} catch (Exception e){
				e.printStackTrace();
			}
		}
		this.Clients = new Vector<Client_itf>();
		this.writer = client;
		return this.object;
	}

	public int getId(){
		return this.id;
	}
	
	public Object getObject(){
		return this.object;
	}
	
	public void setObject(Object o){
		this.object = o;
	}

}
