public class Sentence_stub extends SharedObject implements Sentence_itf, java.io.Serializable { 

public Sentence_stub(int id, Object o) { 
 	super(id); 
} 

	public void write(java.lang.String param0){
		Sentence s = (Sentence)object;
		 s.write(param0);
	}

	public java.lang.String read(){
		Sentence s = (Sentence)object;
		return s.read();
	}

}
