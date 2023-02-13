import java.io.*;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class SharedObject implements Serializable, SharedObject_itf {
	public Object object;
	public int id;
	//private ReentrantLock lock;
	public enum lockState {
		NL, RLC, WLC, RLT, WLT, RLT_WLC
	};
	public lockState Lock;
	private boolean client;
	private ReentrantLock mutex;

	// A constructor to initialize a SharedObject
	public SharedObject(int id) {
		this.object = null;
		this.id = id;
		this.Lock = lockState.NL;
		this.client = true;
		this.mutex = new ReentrantLock();
	}
	// invoked by the user program on the client node
	public void lock_read() {
		mutex.lock();
		boolean askClient = false;
		if (this.Lock == lockState.NL) {
			askClient = true;
		} else if (this.Lock == lockState.RLC) {
			Lock = lockState.RLT;
		} else if (this.Lock == lockState.WLC) {
			Lock = lockState.RLT_WLC;
		} else {
			System.out.println("erreur lock read");
		}
		if (!askClient) {
			return;
		}
		mutex.unlock();
		while (this.Lock != lockState.RLT) {
			this.object = Client.lock_read(this.id);
			synchronized(this){
				if (this.object != null){
					this.Lock = lockState.RLT;
				}
			}
		}
		if (this.object == null) {
			System.out.println("null in lock_read");
		}
		System.out.println("   ->" + this.Lock);
	}


	// invoked by the user program on the client node
	public void lock_write() {
		mutex.lock();
		boolean askClient = false;
		if (this.Lock == lockState.NL || this.Lock == lockState.RLC) {
			askClient = true;
		} else if (this.Lock == lockState.WLC) {
			Lock = lockState.WLT;
		} else {
			System.out.println("erreur lock write");
		}
		if (!askClient) {
			return;
		}
		mutex.unlock();
		while (this.Lock != lockState.WLT) {
			this.object = Client.lock_write(this.id);
			synchronized(this){
				if (this.object != null){
					this.Lock = lockState.WLT;
				}
			}
		}
		if (this.object == null) {
			System.out.println(" object is null après lock_write");
		}
		System.out.println("   ->" + this.Lock);
	}

	// invoked by the user program on the client node
	public synchronized void unlock() {

		if (this.Lock == lockState.RLT) {
			Lock = lockState.RLC;
		} else if (this.Lock == lockState.WLT) {
			Lock = lockState.WLC;
		} else if (this.Lock == lockState.RLT_WLC) {
			Lock = lockState.WLC;
		} else {
			System.out.println("erreur unlock");
		}
		notify();
	}


	// callback invoked remotely by the server
	public synchronized Object reduce_lock() {
		if (this.Lock == lockState.WLT) {
			while (this.Lock == lockState.WLT) {
				try {
					wait();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
			if (this.Lock == lockState.RLT || this.Lock == lockState.RLT_WLC) {
				this.Lock = lockState.RLT;
			}
			if (this.Lock == lockState.WLC) {
				this.Lock = lockState.RLC;
			}
		} else if (this.Lock == lockState.WLC) {
			this.Lock = lockState.RLC;
		} else if (this.Lock == lockState.RLT_WLC) {
			this.Lock = lockState.RLT;
		} else if (this.Lock == lockState.RLC || this.Lock == lockState.NL) {
			while (this.Lock != lockState.WLC) {
				try {
					wait();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
			this.Lock = lockState.RLC;
		} else {
			System.out.println("erreur reduce lock");
		}
		return this.object;
	}

	// callback invoked remotely by the server
	public synchronized void invalidate_reader() {
		if (this.Lock == lockState.RLT || this.Lock == lockState.WLT || this.Lock == lockState.RLT_WLC) {
			while (this.Lock != lockState.RLC) {
				try {
					wait();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
			this.Lock = lockState.NL;
			return;
		} else if (this.Lock == lockState.RLC || this.Lock == lockState.WLC) {
			this.Lock = lockState.NL;
			return;
		} else if (this.Lock == lockState.NL) {
			while (this.Lock != lockState.RLC) {
				try {
					wait();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
			this.Lock = lockState.NL;
			return;
		}
		else {
			System.out.println("erreur invalidate reader");
		}
		this.object = null;
	}

	public synchronized Object invalidate_writer() {
		if (this.Lock == lockState.WLT) {
			while (this.Lock != lockState.WLC) {
				try {
					wait();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
			this.Lock = lockState.NL;
			Object obj2 = this.object;
			this.object = null;
			return obj2;
		} else if (this.Lock == lockState.WLC) {
			this.Lock = lockState.NL;
			Object obj2 = this.object;
			this.object = null;
			return obj2;
		} else if (this.Lock == lockState.RLT_WLC) {
			while (this.Lock != lockState.WLC) {
				try {
					wait();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
			this.Lock = lockState.NL;
			Object obj2 = this.object;
			this.object = null;
			return obj2;
		} else if (this.Lock == lockState.RLC || this.Lock == lockState.NL) {
			while (this.Lock != lockState.WLC) {
				try {
					wait();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
			this.Lock = lockState.NL;
			Object obj2 = this.object;
			this.object = null;
			return obj2;
		} else {
			System.out.println("erreur invalidate writer");
			Object obj2 = this.object;
			this.object = null;
			return obj2;
		}
	}

	public void setId(int n) {
		this.id = n;
	}

	public void setLock(lockState ls) {
		this.Lock = ls;
	}
	public void setClientBool(boolean b){
		this.client = b;
	}

	public boolean getClientBool(){
		return this.client;
	}
	public int getId() {
		return this.id;
	}
	public lockState getLock() {
		return this.Lock;
	}
}
