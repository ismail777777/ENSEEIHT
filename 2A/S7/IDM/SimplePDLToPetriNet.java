package simplepdl.manip;

import java.io.File;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl;

import petrinet.*;
import petrinet.impl.PlaceImpl;
import simplepdl.Allocation;
import simplepdl.Process;
import simplepdl.Ressource;
import simplepdl.SimplepdlFactory;
import simplepdl.SimplepdlPackage;
import simplepdl.WorkDefinition;
import simplepdl.WorkSequence;
import simplepdl.WorkSequenceType;

public class SimplePDLToPetriNet {
	static Map<String,Place> pret = new HashMap<String,Place>();
	static Map<String,Place> lance = new HashMap<String,Place>();
	static Map<String,Place> enExecution = new HashMap<String,Place>();
	static Map<String,Place> termine = new HashMap<String,Place>();
	
	static Map<String,Transition> tr_lance = new HashMap<String,Transition>();
	static Map<String,Transition> tr_termine = new HashMap<String,Transition>();

	public static void main(String[] args) {
		// Chargement du package SimplePDL afin de l'enregistrer dans le registre d'Eclipse.
		SimplepdlPackage packageInstanceSimplePDL = SimplepdlPackage.eINSTANCE;
		PetrinetPackage packageInstancePetriNet = PetrinetPackage.eINSTANCE;
		// Enregistrer l'extension ".xmi" comme devant Ãªtre ouverte Ã 
		// l'aide d'un objet "XMIResourceFactoryImpl"
		Resource.Factory.Registry reg = Resource.Factory.Registry.INSTANCE;
		Map<String, Object> m = reg.getExtensionToFactoryMap();
		m.put("xmi", new XMIResourceFactoryImpl());

		// CrÃ©er un objet resourceSetImpl qui contiendra une ressource EMF (notre modÃ¨le)
		ResourceSet resSet = new ResourceSetImpl();
		
		// Charger la ressource (notre modÃ¨le)
		URI sortieURI = URI.createURI("PetriNet_java.xmi");
		Resource Sortie = resSet.createResource(sortieURI);

		ResourceSet resSetModel = new ResourceSetImpl();
		URI modelURI = URI.createURI("Process2.xmi");
		Resource resource = resSetModel.getResource(modelURI, true);

		// RÃ©cupÃ©rer le premier Ã©lÃ©ment du modÃ¨le (Ã©lÃ©ment racine)
		Process process = (Process) resource.getContents().get(0);

		// La fabrique pour fabriquer les Ã©lÃ©ments de PetriNet
	    PetrinetFactory myFactory = PetrinetFactory.eINSTANCE;

		// CrÃ©er un Ã©lÃ©ment PetriNet
		PetriNet petrinet = myFactory.createPetriNet();
		petrinet.setName(process.getName());
	
		Sortie.getContents().add(petrinet);

        for (Object o : process.getProcessElements()) {
        	// Convertir les Ressources
            if (o instanceof Ressource) {
            	Ressource r = (Ressource) o;
            	Place p = myFactory.createPlace();
        		p.setName("Ressource "+r.getName());
        		p.setNbJeton(r.getQuantite());
        		p.setNet(petrinet);
        		petrinet.getPetrinetelement().add(p);
        		for (Allocation a : r.getAllocation()) {
        			Arc arc_Allocation = myFactory.createArc();
        			arc_Allocation.setDestination(lance.get(a.getWorkdefinition().getName()));
        			arc_Allocation.setSource(p);
        			arc_Allocation.setPoids(a.getOccurence());
        			petrinet.getPetrinetelement().add(arc_Allocation);
        			Arc arc_Allocation2 = myFactory.createArc();
        			arc_Allocation2.setSource(termine.get(a.getWorkdefinition().getName()));
        			arc_Allocation2.setDestination(p);
        			arc_Allocation2.setPoids(a.getOccurence());
        			petrinet.getPetrinetelement().add(arc_Allocation2);
        		}
            }
            // Convertir les WorkDefinitions
            else if (o instanceof WorkDefinition) {
            	WorkDefinition wd = (WorkDefinition)o;
            	
            	Place petri_pret = myFactory.createPlace();
            	petri_pret.setName(wd.getName()+" pret");
            	petri_pret.setNbJeton(1);
            	petri_pret.setNet(petrinet);
            	petrinet.getPetrinetelement().add(petri_pret);

            	Place petri_lance = myFactory.createPlace();
            	petri_lance.setName(wd.getName()+" lancé");
            	petri_lance.setNbJeton(0);
            	petri_lance.setNet(petrinet);
            	petrinet.getPetrinetelement().add(petri_lance);

            	Place petri_enExecution = myFactory.createPlace();
            	petri_enExecution.setName(wd.getName()+" en execution");
            	petri_enExecution.setNbJeton(0);
            	petri_enExecution.setNet(petrinet);
            	petrinet.getPetrinetelement().add(petri_enExecution);

            	Place petri_termine = myFactory.createPlace();
            	petri_termine.setName(wd.getName()+" terminé");
            	petri_termine.setNbJeton(0);
            	petri_termine.setNet(petrinet);
            	petrinet.getPetrinetelement().add(petri_termine);
            	/*les transitions*/
            	Transition t_lance = myFactory.createTransition();
            	t_lance.setName(wd.getName()+" lancée");
            	t_lance.setNet(petrinet);
            	petrinet.getPetrinetelement().add(t_lance);
    
            	Transition t_termine = myFactory.createTransition();
            	t_termine.setName(wd.getName()+" terminée");
            	t_termine.setNet(petrinet);
            	petrinet.getPetrinetelement().add(t_termine);
            	/* Transformation des arcs*/
            	Arc arc_pret_lance = myFactory.createArc();
            	arc_pret_lance.setSource(petri_pret);
            	arc_pret_lance.setDestination(t_lance);
            	arc_pret_lance.setPoids(1);
            	arc_pret_lance.setType(ArcType.NORMAL);
            	arc_pret_lance.setNet(petrinet);
            	petrinet.getPetrinetelement().add(arc_pret_lance);
            	
            	Arc arc_lance_lance = myFactory.createArc();
            	arc_lance_lance.setSource(t_lance);
            	arc_lance_lance.setDestination(petri_lance);
            	arc_lance_lance.setPoids(1);
            	arc_lance_lance.setType(ArcType.NORMAL);
            	arc_lance_lance.setNet(petrinet);
            	petrinet.getPetrinetelement().add(arc_lance_lance);
            	
            	Arc arc_enExecution_termine = myFactory.createArc();
            	arc_enExecution_termine.setSource(petri_enExecution);
            	arc_enExecution_termine.setDestination(t_termine);
            	arc_enExecution_termine.setPoids(1);
            	arc_enExecution_termine.setType(ArcType.NORMAL);
            	arc_enExecution_termine.setNet(petrinet);
            	petrinet.getPetrinetelement().add(arc_enExecution_termine);
            	
            	Arc arc_lance_enExecution = myFactory.createArc();
            	arc_lance_enExecution.setSource(t_lance);
            	arc_lance_enExecution.setDestination(petri_enExecution);
            	arc_lance_enExecution.setPoids(1);
            	arc_lance_enExecution.setType(ArcType.NORMAL);
            	arc_enExecution_termine.setNet(petrinet);
            	petrinet.getPetrinetelement().add(arc_lance_enExecution);
            	
            	Arc arc_termine_termine = myFactory.createArc();
            	arc_termine_termine.setSource(t_termine);
            	arc_termine_termine.setDestination(petri_termine);
            	arc_termine_termine.setPoids(1);
            	arc_termine_termine.setType(ArcType.NORMAL);
            	arc_termine_termine.setNet(petrinet);
            	petrinet.getPetrinetelement().add(arc_termine_termine);

            	pret.put(wd.getName(), petri_pret);
            	lance.put(wd.getName(), petri_lance);
            	enExecution.put(wd.getName(), petri_enExecution);
            	termine.put(wd.getName(), petri_termine);
            	tr_lance.put(wd.getName(),t_lance);
            	tr_termine.put(wd.getName(), t_termine);
            }
         // Convertir les WorkSequences
            else if (o instanceof WorkSequence) {
            	WorkSequence ws = (WorkSequence)o;
            	Arc petri_source_destination = myFactory.createArc();
            	switch (ws.getLinkType()) {
            	case START_TO_START:
            		petri_source_destination.setSource(lance.get(ws.getPredecessor().getName()));
            		petri_source_destination.setDestination(tr_lance.get(ws.getSuccessor().getName()));
            	case START_TO_FINISH:
            		petri_source_destination.setSource(lance.get(ws.getPredecessor().getName()));
            		petri_source_destination.setDestination(tr_termine.get(ws.getSuccessor().getName()));
            	case FINISH_TO_FINISH:
            		petri_source_destination.setSource(termine.get(ws.getPredecessor().getName()));
            		petri_source_destination.setDestination(tr_termine.get(ws.getSuccessor().getName()));
            	case FINISH_TO_START:
            		petri_source_destination.setSource(termine.get(ws.getPredecessor().getName()));
            		petri_source_destination.setDestination(tr_lance.get(ws.getSuccessor().getName()));
            	default:
            		break;         			
            	}
            	petri_source_destination.setPoids(1);
            	petri_source_destination.setType(ArcType.READ_ARC);
            	petri_source_destination.setNet(petrinet);
            	petrinet.getPetrinetelement().add(petri_source_destination);
            }
	}
        try {
        	Sortie.save(Collections.EMPTY_MAP);
        } catch (Exception e) {
        	e.printStackTrace();
        }
	}
	
}