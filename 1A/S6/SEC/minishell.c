#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include "readcmd.h"
#include "readcmd.c"
#include <sys/wait.h>
#include "listeProc.h"
#include "listeProc.c"
#include <signal.h>
#include <fcntl.h>

typedef struct cmdline cmdline;
listeProc* liste;
pid_t proc_courant = 0;
int n =0;
bool ctrl_z = false;
bool ctrl_c = false;

void handler_SIGTSTP(int signal) {
    if (proc_courant != 0) {
        kill(proc_courant, SIGSTOP);
        printf("[%d] suspendu\n", proc_courant);
        int pos;
        int k = 0;
        while(liste[k] != NULL) {
            if (liste[k]->pid == proc_courant) {
                pos = k;
            }
            k = k+1;
        }
        ctrl_z = true;
        strcpy(liste[pos]->etat, "suspendu");
    }
}

void handler_SIGINT(int signal) {
    if (proc_courant != 0) {
        kill(proc_courant, SIGKILL);
        ctrl_c = true;
        supprimer(liste, proc_courant);
        printf("[%d] suspendu\n", proc_courant);
    }
}

void handler_SIGCHLD(int signal) {
    pid_t fils;
    int wstatus;
    do {
        fils = (int) waitpid(-1, &wstatus, WNOHANG | WUNTRACED | WCONTINUED);
        if ((errno != ECHILD) && (fils == -1)) {
            printf("Erreur waitpid\n");
            exit(1);
        } else if (fils > 0) {
            if (WIFSTOPPED(wstatus)) {
                if (!(ctrl_z )) {
                    int pos;
                    int k = 0;
                    while(liste[k] != NULL) {
                        if (liste[k]->pid == fils) {
                            pos = k;
                        }
                        k = k+1;
                    }
                    strcpy(liste[pos]->etat, "suspendu");
                }
            } else if (WIFCONTINUED(wstatus)) {
                 int pos;
                 int k = 0;
                 while(liste[k] != NULL) {
                        if (liste[k]->pid == fils) {
                            pos = k;
                        }
                        k = k+1;
                 }
                 strcpy(liste[pos]->etat, "actif");
            } else if (WIFEXITED(wstatus) || WIFSIGNALED(wstatus)) {
                supprimer(liste, fils);
                proc_courant = 0;
                n--;
            }
        }
    } while (fils > 0);   
    
}

void exec_cmd_list(listeProc* liste) {
    afficher(liste);
}

void exec_cmd_stop(cmdline* cmd, listeProc* liste) {
    pid_t pid = getPid(liste, atoi(cmd->seq[0][1]));
    kill(pid, SIGSTOP);
    sleep(1);
}

void exec_cmd_fg(listeProc* liste, cmdline* cmd) {
    int id = atoi(cmd->seq[0][1]);
    pid_t pid = getPid(liste, id);
    kill(pid, SIGCONT);
    proc_courant = pid;
    do {
        sleep(1);
    } while (proc_courant == pid);
    proc_courant = 0;
}

void exec_cmd_bg(listeProc* liste, cmdline* cmd) {
    int id = atoi(cmd->seq[0][1]);
    pid_t pid = getPid(liste, id);
    kill(pid, SIGCONT);
    proc_courant = 0;
}

void exec_cmd_susp() {
    if (proc_courant != 0) {
        kill(proc_courant, SIGSTOP);
        printf("[%d] suspendu\n", proc_courant);
        int pos;
        int k = 0;
        while(liste[k] != NULL) {
            if (liste[k]->pid == proc_courant) {
                pos = k;
            }
            k = k+1;
        }
        ctrl_z = true;
        strcpy(liste[pos]->etat, "suspendu");
    }
}

int main() {
    cmdline *cmd;
    char cwd[250];
    pid_t fils;
    pid_t fils_termine;
    int wstatus;
    int status;
    idProcCourant = 0;

    liste = malloc(20*sizeof(listeProc));
    signal(SIGCHLD, handler_SIGCHLD);
    signal(SIGINT, handler_SIGINT);
    signal(SIGTSTP, handler_SIGTSTP); 
    int pipe_f2p[2];
    while (true) {
        proc_courant = 0;
        ctrl_c = false;
        ctrl_z = false;
        printf("ismail@elalout %s ", getcwd(cwd, sizeof(cwd)));
        cmd = readcmd();
        if (cmd->seq[0][0] == NULL) {
            continue;
        }
        if (strcmp(cmd->seq[0][0], "exit") == 0) {
            exit(0);
        }
        else if (strcmp(cmd->seq[0][0], "cd") == 0) {
            chdir(cmd->seq[0][1]);
        }
        else if (strcmp(cmd->seq[0][0], "lj") == 0) {
            exec_cmd_list(liste);
        }
        else if (strcmp(cmd->seq[0][0], "sj") == 0) {
            exec_cmd_stop(cmd, liste) ;
        }
        else if (strcmp(cmd->seq[0][0], "fg") == 0) {
            exec_cmd_fg(liste, cmd);
        }
        else if (strcmp(cmd->seq[0][0], "bg") == 0) {
            exec_cmd_bg(liste, cmd);
        }
        else if (strcmp(cmd->seq[0][0], "susp") == 0) {
            exec_cmd_susp();
        }
            
        else {
             fils = fork();
             if (fils < 0) {
                printf("Erreur fork\n");
                exit(1);
             }
             if (fils == 0) { /* fils */
             
                /*Tubes simples */
                if (cmd->seq[1] != NULL) {
                    int petit_fils;
                    if (pipe(pipe_f2p) == -1) {
                        printf("Erreur PIPE\n");
                        exit(1);
                    }
                    petit_fils = fork();
                    if (petit_fils < 0) {
                        printf("Erreur fork\n");
                        exit(1);
                    }
                    if (petit_fils == 0) {
                        close(pipe_f2p[0]);
                        if (dup2(pipe_f2p[1], STDOUT_FILENO) == -1) {
                            perror("dup2");
                            exit(EXIT_FAILURE);
                        }
                        execlp(cmd->seq[0][0],cmd->seq[0][0], NULL);
                        close(pipe_f2p[1]);
                    }
                    
                    else {
                        close(pipe_f2p[1]);
                        if (dup2(pipe_f2p[0], STDIN_FILENO) == -1) {
                            perror("dup2");
                            exit(EXIT_FAILURE);
                        }
                        close(pipe_f2p[0]);
                        execlp(cmd->seq[1][0],cmd->seq[1][0], cmd->seq[1][1], NULL);
                        perror(cmd->seq[1][0]);
                        exit(EXIT_FAILURE);
                    }
                }
                if (cmd->seq[2] != NULL) {
                    int pipe_f2p_2[2];
                    int petit_fils_1;
                    int petit_fils_2;
                    if (pipe(pipe_f2p_2) == -1) {
                        printf("Erreur PIPE\n");
                        exit(EXIT_FAILURE);
                    }
                    petit_fils_1 = fork();
                    if (petit_fils_1 < 0) {
                        printf("Erreur fork\n");
                        exit(EXIT_FAILURE);
                    }
                    if (petit_fils_1 == 0) {
                        close(pipe_f2p_2[0]);
                        if (dup2(pipe_f2p_2[1], STDOUT_FILENO) == -1) {
                            perror("dup2");
                            exit(EXIT_FAILURE);
                        }
                        close(pipe_f2p_2[1]);
                        if (pipe(pipe_f2p) == -1) {
                            printf("Erreur PIPE\n");
                            exit(EXIT_FAILURE);
                        }
                        petit_fils_2 = fork();
                        if (petit_fils_2 < 0) {
                            printf("Erreur fork\n");
                            exit(EXIT_FAILURE);
                        }
                        if (petit_fils_2 == 0) {
                            close(pipe_f2p[0]);
                            if (dup2(pipe_f2p[1], STDOUT_FILENO) == -1) {
                                perror("dup2");
                                exit(EXIT_FAILURE);
                            }
                            close(pipe_f2p[1]);
                            execlp(cmd->seq[0][0], cmd->seq[0][0], NULL);
                            exit(EXIT_FAILURE);
                        } else {
                            close(pipe_f2p[1]);
                            if (dup2(pipe_f2p[0], STDIN_FILENO) == -1) {
                                perror("dup2");
                                exit(EXIT_FAILURE);
                            }
                            close(pipe_f2p[1]);
                            execlp(cmd->seq[1][0], cmd->seq[1][0], cmd->seq[1][1], NULL);
                            exit(EXIT_FAILURE);
                        }
                    } else {
                        close(pipe_f2p_2[1]);
                        if (dup2(pipe_f2p_2[0], STDIN_FILENO) == -1) {
                            perror("dup2");
                            exit(EXIT_FAILURE);
                        }
                        close(pipe_f2p_2[0]);
                        execlp(cmd->seq[2][0],cmd->seq[2][0], cmd->seq[1][1], NULL);
                        perror(cmd->seq[2][0]);
                        exit(EXIT_FAILURE);
                    }
                }    
                sigset_t set;
                sigemptyset(&set);
                sigaddset(&set,SIGINT);
                sigaddset(&set,SIGTSTP);
                sigprocmask(SIG_BLOCK,&set,NULL);
                    
                if (cmd->backgrounded != NULL) {
                    
                    int k = 0;
                    char commande[255];
                    while (!(cmd->seq[0][k] == NULL)) {
                        strcat(commande,cmd->seq[0][k]);
                        strcat(commande," ");
                        k++;
                    }
                    ajouter(liste, fils, n++, commande);
                    printf("[%i] %i\n", n, fils);
                }
             
                /*On vérifie si la ligne de commande contient < */
                if (cmd->in != NULL) {
                    int desc_fic_lecture = open(cmd->in,O_RDONLY);
                    if (desc_fic_lecture < 0) {
                        perror("Erreur d'ouverture");
                        exit(1);
                    }
                    if (dup2(desc_fic_lecture,0) == -1) { 
                        perror("Erreur dup2\n ");
                        exit(1);
                    } 
                    close(desc_fic_lecture);
                    
                }
                /*On vérifie si la ligne de commande contient > */
                if (cmd->out != NULL) {
                    int desc_fic_ecriture = open(cmd->out,O_WRONLY | O_TRUNC | O_CREAT, 0640);
                    if (desc_fic_ecriture < 0) {
                        perror("Erreur d'ouverture");
                        exit(1);
                    }
                    if (dup2(desc_fic_ecriture,1) == -1) {
                        perror("Erreur dup2\n");
                        exit(1);
                    }
                    close(desc_fic_ecriture);
                    
                }
                execvp(cmd->seq[0][0], cmd->seq[0]);
             }   
             else { /* père */
                int k = 0;
                char commande[255];
                while (cmd->seq[0][k] != NULL) {
                    strcat(commande,cmd->seq[0][k]);
                    strcat(commande," ");
                    k++;
                }
                ajouter(liste, fils, n++, commande);
                
                //fils_termine = wait(&wstatus);
                /*if (WIFEXITED(wstatus) && wstatus == 0) {
                    continue;
                }*/
                if (cmd->backgrounded == NULL) {
                    proc_courant = fils;
                    waitpid(fils, &status, WUNTRACED);
                    if (!WIFSTOPPED(status)) {
                        supprimer(liste, fils);
                        n--;
                    }
                    proc_courant = 0;
                }
             }
        }
    }
    return EXIT_SUCCESS;
}


