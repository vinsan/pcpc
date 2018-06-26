SANTORO VINCENZO MATR. 0522500487

Il progetto è stato testato su un Cluster Amazon di dimensione 8 con macchine M4.xlarge generato tramite lo script aws-build-cluster-script di Sergio Guastaferro: https://github.com/isislab-unisa/aws-build-cluster-script

Nella cartella Debug è presente il makefile per compilare il progetto. Una volta compilato è possibile eseguire il programma digitando
mpirun -np x  --hostfile myhostfile_x pi param
con x numero di nodi con i quali si vuole eseguire il programma e param il numero di iterazioni totali da eseguire. param è un parametro opzionale, se non viene fornito il programma effettuerà 1E7 iterazioni per Tapezoid e 1E7 iterazioni per Montecarlo. Il numero totale di iterazioni è memorizzato in una variabile di tipo long.

MPI: le funzioni MPI utilizzate sono MPI_Init(&argc, &argv), MPI_Comm_rank(MPI_COMM_WORLD, &my_rank), e MPI_Comm_size(MPI_COMM_WORLD, &num_procs) per l'inizializzazione; MPI_Wtime() per calcolare il tempo di esecuzione e MPI_Reduce come funzione di comunicazione collettiva.

OUTPUT: il programma stampa a video il valore di Pi Greco calcolato con la Tapezoid rule e il relativo tempo di esecuzione, poi stampa a video il valore di Pi Greco calcolato con il metodo Montecarlo e il relativo tempo di esecuzione per poi terminare.

LIBRERIE e DATI: oltre alla libreria di MPI, non sono richieste librerie esterne per eseguire il programma. Non si utilizzano dati esterni in quanto l'unico valore necessario è fornito in input dall'utente oppure viene utilizzato un valore di default.

TEST E GRAFICI: I test di Strong Scaling sono stati effettuati impostando come come valore di param fisso 2147483647 (il valore masismo per una variabile di tipo long).
I test di Weak Scaling sono stati effettuati incrementando in maniera lineare param di 1E8 per ogni nodo secondo il seguente schema:
1 - 1E8
2 - 2E8
3 - 3E8
4 - 4E8
5 - 5E8
6 - 6E8
7 - 7E8
8 - 8E8
Per come è strutturata la distribuzione del carico, questo significa che ogni nodo eseguirà 1E8 calcoli per la Tapezoid Rule e 1E8 calcoli per il metodo Montecarlo.

I grafici sono stati realizzati con Excel. Non ci sono segnalazioni particolari per quanto riguarda i 2 grafici dei tempi. Per quanto riguarda i grafici del Pi greco, si segnala che sono stati realizzati in 3D anzicchè 2D per garantire una maggiore leggibilità ed il confronto con il Pi Greco Reale e che, date le limitazioni di Excel, i valori di Pi Greco calcolati dal progetto sono stati arrotondati (per difetto o per eccesso a seconda dei casi) da 16 cifre decimali a 14 cifre decimali. I valori completi dei test sono forniti nel pdf allegato. 

Compressione del progetto:
tar -cvf solution.tar.gz *

Estrazione del Progetto:
tar -xvf solution.tar.gz
