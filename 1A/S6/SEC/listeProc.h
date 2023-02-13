#ifndef _LISTEPROC_H
#define _LISTEPROC_H

#define Taille 400
struct listeProc {
    int id;
    pid_t pid;
    char etat[10];
    char cmd[255];
};
typedef struct listeProc *listeProc;


pid_t getPid(listeProc *liste, int id);

bool existe(listeProc *liste, pid_t pid);

void ajouter(listeProc *liste, pid_t pid, int id, char cmd[255]);

void supprimer(listeProc* liste, pid_t pid);

int getTailleListe(listeProc* liste);

void afficher(listeProc* liste);

#endif
