#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include "listeProc.h" 

int idProcCourant;

pid_t getPid(listeProc *liste, int id) {
    int k = 0;
    pid_t pid = -1;
    if (liste[0] != NULL) {
        do {
            if (liste[k]->id == id) {
                pid = liste[k]->pid;
                break;
            }
            k = k + 1;
        } while (liste[k] != NULL);
    }
    return pid;
}

bool existe(listeProc *liste, pid_t pid) {
    int k = 0;
    bool res = false;
    if (liste[0] != NULL) {
        do {        
            if (liste[k]->pid == pid) {
                res = true;
                break;
            }
            k = k + 1;
        } while (liste[k] != NULL);
    }
    return res;
}

int getTailleListe(listeProc* liste) {
    int k = 0;
    if (liste[0] != NULL) {
        do {
            k = k + 1;
        } while (liste[k] != NULL);
    }
    return k;
}

void ajouter(listeProc *liste, pid_t pid, int id, char cmd[255]) {
    if (existe(liste, pid) == false) {
        int length = getTailleListe(liste);
        liste[length] = malloc(Taille);
        liste[length]->id = id;
        strcpy(liste[length]->etat, "En cours");
        strcpy(liste[length]->cmd, cmd);
        idProcCourant ++;
    }
}

void supprimer(listeProc* liste, pid_t pid) {
    if (existe(liste, pid) == true) {
        int length = getTailleListe(liste);
        int indice;
        int k = 0;
        while(liste[k] != NULL) {
            if (liste[k]->pid == pid) {
                indice = k;
                break;
            }
            k = k+1;
        }
        for (int i = indice + 1; i < length; i++) {
            liste[i-1] = liste[i];
        }
        free(liste[length - 1]);
        liste[length - 1] = NULL;
        liste = calloc(length-1, sizeof(liste));
    }
}

void afficher(listeProc* liste) {
    int length = getTailleListe(liste);
    int k = 0;
    if (length > 0) {
        printf(" id         pid         état            commande\n");
        while (k<length) {
            printf("%d      %d      %s      %s\n", liste[k]->id, liste[k]->pid, liste[k]->etat, liste[k]->cmd);
            k++;
        }
    }
}


