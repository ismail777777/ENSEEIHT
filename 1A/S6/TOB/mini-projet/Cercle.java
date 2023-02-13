import java.awt.Color;

/**La classe Cercle modélise un cercle dans un plan équipé d'un repère cartésien.
 * Le centre et le rayon du cercle peuvent être définis et modifiés.
 * @author Ismail EL ALOUT
 */
public class Cercle implements Mesurable2D {
    /** La constante pi.*/
    public static final double PI = Math.PI;
    /** Le rayon du cercle.*/
    private double rayon;
    /** Le centre du cercle.*/
    private Point centre;
    /** La couleur du cercle.*/
    private Color couleur;

    /** Construire un cercle à partir de son centre et de son rayon.
	 * @param centre centre
	 * @param rayon rayon
	 */
    public Cercle(Point centre, double rayon) {
        assert (centre != null);
        assert (rayon > 0);
        this.setRayon(rayon);
        this.centre = new Point(centre.getX(), centre.getY());
        this.setCouleur(Color.blue);
    }
    /**construire un cercle à partir de deux points diamétralement opposés.
     * sa couleur est considérée comme étant le bleu.
	 * @param a est un point diamétralement opposés à b
	 * @param b est un point diamétralement opposés à a
	 */
	public Cercle(Point a, Point b) {
	    assert (a != null);
	    assert (b != null);
        this.setRayon(a.distance(b) / 2);
        this.centre = new Point((a.getX() + b.getX()) / 2, (a.getY() + b.getY()) / 2);
        this.setCouleur(Color.blue);
    }
    /**construire un cercle à partir de deux points diamétralement opposés
     * et de sa couleur.
	 * @param a est un point diamétralement opposés à b
	 * @param b est un point diamétralement opposés à a
	 * @param nouvellecouleur nouvelle couleur
	 */
    public Cercle(Point a, Point b, Color nouvellecouleur) {
        assert (a != null);
        assert (b != null);
        assert (a.getX() != b.getX() || a.getY() != b.getY());
        assert (nouvellecouleur != null);
        this.setRayon(a.distance(b) / 2);
        this.centre = new Point(0, 0);
        this.centre.setX((a.getX() + b.getX()) / 2);
        this.centre.setY((a.getY() + b.getY()) / 2);
        this.setCouleur(nouvellecouleur);
    }
    /**Obtenir le centre d'un cercle.
	 * @return centre du cercle
	 */
	public Point getCentre() {
	    Point p = new Point(this.centre.getX(), this.centre.getY());
		return p;
	}
	/**Obtenir le rayon du cercle.
	 * @return rayon du cercle
	 */
	public double getRayon() {
		return this.rayon;
	}
	/**Obtenir le diamètre du cercle.
	 * @return diamètre du cercle
	 */
	public double getDiametre() {
		return 2 * this.getRayon();
	}
	/**Translater un cercle avec un déplacement suivant l’axe des x
	 * et un déplacement suivant l’axe des y.
	 * @param dx est le déplacement suivant l’axe des X
	 * @param dy est le déplacement suivant l’axe des Y
	 */
	public void translater(double dx, double dy) {
		this.centre.translater(dx, dy);
	}
    /**Vérifier si un point est à l'intérieur au d'un cercle.
	 * @param p est le point qu'on va vérifié
	 * @return boolean vrai si le point est à l'intérieur du cercle, sinon faux
	 */
	public boolean contient(Point p) {
		assert (p != null);
	    return (this.getCentre().distance(p) <= this.getRayon());
	}
	/**Obtenir le perimètre du cercle.
	 * @return double est le perimètre du cercle
	 */
	public double perimetre() {
	    return 2 * PI * this.getRayon();
	}
	/**Obtenir l'aire du cercle.
	 * @return double est l'aire du cercle
	 */
	public double aire() {
	    return PI * this.getRayon() * this.getRayon();
	}
//  Gestion de la couleur
	/**Obtenir la couleur du cercle.
	 * @return la couleur du cercle
	 */
	public Color getCouleur() {
		return this.couleur;
	}
	/**Changer la couleur du cercle.
	  * @param nouvelleCouleur nouvelle couleur
	  */
	public void setCouleur(Color nouvelleCouleur) {
	    assert (nouvelleCouleur != null);
		this.couleur = nouvelleCouleur;
	}
    /**Créer un cercle à partir de deux points, le premier correspond au centre du
	 * cercle et le deuxième est un point du cercle de sa circonférence), ces deux
	 * points forment donc un rayon du cercle, avec une couleur bleue par défaut.
	 * @param a est le point correspond au centre du cercle
	 * @param b est un point du cercle de sa circonférence
	 * @return Cercle est le cercle créé à partir du a et b
	 */
    public static Cercle creerCercle(Point a, Point b) {
    	assert (a != null);
    	assert (b != null);
    	assert (a != b);
        Cercle c = new Cercle(a, a.distance(b));
        return c;
    }
	/**Changer le rayon du cercle.
	 * @param rayon est le nouveau rayon du cercle
	 */
	public void setRayon(double rayon) {
	    assert (rayon > 0);
	    this.rayon = rayon;
	}
	/**changer le diamètre du cercle.
	 * @param diametre est le diamètre du cercle
	 */
	public void setDiametre(double diametre) {
	    assert (diametre > 0);
	    this.rayon = diametre / 2;
    }
    /**Afficher un cercle sous la forme Cr@(a, b).
	 * @return String[] est une chaine de caractère
	 */
	 public String toString() {
	    String string =  "C" + this.rayon + "@" + this.centre;
	    return string;
	 }
}
