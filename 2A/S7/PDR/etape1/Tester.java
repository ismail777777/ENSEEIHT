
public class Tester {

	SharedObject sentence;

public static void main(String argv[]) {
		if (argv.length != 2) {
			System.out.println("donner un nom et un entier");
			return;
		}
		Client.init(); //initialisation
		SharedObject so = Client.lookup("IRC");
		if (so == null) {
			System.out.println("L'objet n'existe pas. On le crée alors");
			so = Client.create(new Sentence());
			Client.register("IRC", so);
		}
		int count = 0;
		while (count < Integer.parseInt(argv[1])) {
			System.out.println(count++);
			so.lock_write();
			// invoke the method
			((Sentence)(so.object)).write(argv[0]+" écrit ");
			so.unlock();
			so.lock_read();
			// invoke the method
			System.out.println(((Sentence)(so.object)).read());
			so.unlock();		
		}
		System.out.println("Fin du test.");
	}
}
