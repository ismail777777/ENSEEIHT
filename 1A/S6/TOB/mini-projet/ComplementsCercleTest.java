import java.awt.Color;
import org.junit.*;
import static org.junit.Assert.*;

/**
  * Classe de tests complémentaires de la classe Cercle
  * @author	EL ALOUT ISMAIL
  */
public class ComplementsCercleTest {
	
	// précision pour les comparaisons réelle
	public final static double EPSILON = 0.001;
	
	
    private Point A, B;		
	private Cercle C;	
	
	/**
	 * Initialiser les attributs de la classe ComplementCercleTest
	 */
	@Before public void setUp() {
		// Création des points
                A = new Point(4, 2);
                B = new Point(2, 3);

        // Construction d'un cercle
                C = new Cercle(A, 7.0);

	}

    	@Test public void tester() {
		// Test pour C
		assertEquals("abscisse du centre", C.getCentre().getX(), 4.0, EPSILON);
		assertEquals("ordonnée du centre", C.getCentre().getY(), 2.0, EPSILON);
		assertEquals("rayon", C.getRayon(), 7.0, EPSILON);
		assertEquals("couleur", C.getCouleur(), Color.blue);
		
		// Vérifier que C contient B 
		assertTrue(C.contient(B));

		// Changement du rayon de C
		C.setRayon(1.0);
		assertEquals("rayon",C.getRayon(), 1.0, EPSILON);

		// Vérifier que C ne contient pas B
        assertFalse(C.contient(B));

		// Changer le rayon de C
        C.setRayon(21);
        assertEquals("rayon", C.getRayon(), 21, EPSILON);


		// Translater C de 10 suivant X et 18 suivant Y
		C.translater(10, 18);
        assertEquals("abscisse du centre", C.getCentre().getX(), 14, EPSILON);
        assertEquals("ordonnée du centre", C.getCentre().getY(), 20, EPSILON);

		// Vérifier le perimetre
		assertEquals("périmètre", C.perimetre(), 131.946, EPSILON);
       // assertEquals(" aire", C.aire(), 1385,4, EPSILON);
	}

    	/**
	* Méthode pricipale de la classe ComplementCercleTest
	* @param args est la variable d'environnement qui est une table de caractères
	*/
	public static void main(String[] args) {
		org.junit.runner.JUnitCore.main("ComplementsCercleTest");
	}

}
