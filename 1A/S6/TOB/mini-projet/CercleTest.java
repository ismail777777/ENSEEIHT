import java.awt.Color;
import org.junit.*;
import static org.junit.Assert.*;

/**
  * Classe de test de la classe Cercle.
  * @author	 El Alout Ismail
  */

public class CercleTest {
    
    // Précision pour les comparaisons réelles
    public final static double EPSILON = 0.001;
    
    private Point A, B, C, D;
    
    private Cercle C1, C2;
    
    /**  Méthode pour tester l'exigence E12
      * @param A le 1er point
      * @param B le 2ème point
      * @param C le 3ème point
      * @param D le 4ème point
      */
      
       
      @Test public void testE12() {
        // construction des points
        A = new Point(1, 1);
	    B = new Point(4, 1);
        C = new Point(4, 5);
        D = new Point(4, 3);
        
        // Construction des cercles
        C1 = new Cercle(A,B);
        C2 = new Cercle(C,D);
        
        // test C1
        assertEquals("abscisse du centre ", C1.getCentre().getX(), 2.5, EPSILON);
        assertEquals("ordonnée du centre ", C1.getCentre().getY(), 1.0, EPSILON);
        assertEquals("rayon ", C1.getRayon(), 1.5, EPSILON);
        assertEquals("couleur ", C1.getCouleur(), Color.blue);
        
        // Test C2
        assertEquals("abscisse du centre ", C2.getCentre().getX(), 4.0, EPSILON);
        assertEquals("ordonnée du centre ", C2.getCentre().getY(), 4.0, EPSILON);
        assertEquals("rayon ", C2.getRayon(), 1.0, EPSILON);
        assertEquals("couleur ", C2.getCouleur(), Color.blue);

      }
        
        /**  Méthode pour tester l'exigence E13
      * @param A le 1er point
      * @param B le 2ème point
      * @param C le 3ème point
      * @param D le 4ème point
      */
      @Test public void testE13() {
        A = new Point(1, 6);
	    B = new Point(1, 4);
        C = new Point(3, 7);
        D = new Point(3, 12);
        // Construction des cercles
        C1 = new Cercle(A,B,Color.black);
        C2 = new Cercle(C,D,Color.green);
        
        // test C1
        assertEquals("abscisse du centre ", C1.getCentre().getX(), 1.0, EPSILON);
        assertEquals("ordonnée du centre ", C1.getCentre().getY(), 5.0, EPSILON);
        assertEquals("rayon ", C1.getRayon(), 1.0, EPSILON);
        assertEquals("couleur ", C1.getCouleur(), Color.black);

        
        // Test C2
        assertEquals("abscisse du centre ", C2.getCentre().getX(), 3.0, EPSILON);
        assertEquals("ordonnée du centre ", C2.getCentre().getY(), 9.5, EPSILON);
        assertEquals("rayon ", C2.getRayon(), 2.5, EPSILON);
        assertEquals("couleur ", C2.getCouleur(), Color.green);

      }
        /** Méthode pour tester l'exigence E14
      * @param A le 1er point
      * @param B le 2ème point
      * @param C le 3ème point
      * @param D le 4ème point
      */
      
      @Test public void testE14() {
        Point A = new Point(1,5);
        Point B = new Point(4,2);
        Point C = new Point(4,5);
        Point D = new Point(6,3);
        // Construction des cercles
        Cercle C1 = new Cercle(new Point(0,0), 0.1);
        Cercle C2 = new Cercle(new Point(0,0),0.5);
        C1 = C1.creerCercle(A,B);
        C2 = C2.creerCercle(C,D);
        
        // test C1
        assertEquals("abscisse du centre ", C1.getCentre().getX(), 1.0, EPSILON);
        assertEquals("ordonnée du centre ", C1.getCentre().getY(), 5.0, EPSILON);
        assertEquals(" rayon ", C1.getRayon(), 4.242, EPSILON);
        assertEquals("couleur ", C2.getCouleur(), Color.blue);
        
        // test C2
        assertEquals("abscisse du centre ", C2.getCentre().getX(), 4.0, EPSILON);
        assertEquals("ordonnée du centre ", C2.getCentre().getY(), 5.0, EPSILON);
        assertEquals(" rayon ", C2.getRayon(), 2.828, EPSILON);
        assertEquals("couleur ", C2.getCouleur(), Color.blue);

        }
        
        /**
	    * Méthode pricipale de la classe CercleTest
	    * @param args est la variable d'environnement qui est une table de caractères
	    */
	    public static void main(String[] args) {
		    org.junit.runner.JUnitCore.main("CercleTest");
    	}
}
