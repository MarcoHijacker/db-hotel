Studente : Marco Longo
Esercizio Database Hotel - GROUP BY and JOIN 11.09.20 (Boolean Careers):

GOAL: 

GROUP BY
    • Conta gli ospiti raggruppandoli per anno di nascita.
Soluzione:
---
SELECT YEAR(date_of_birth), COUNT(*)
FROM ospiti
GROUP BY YEAR(date_of_birth)
---
    • Somma i prezzi dei pagamenti raggruppandoli per status.
Soluzione:
---
SELECT status, SUM(price)
FROM pagamenti
GROUP BY status
---
    • Conta quante volte è stata prenotata ogni stanza.
Soluzione:
---
SELECT stanza_id, COUNT(*)
FROM prenotazioni
GROUP BY stanza_id
---
    • Fai una analisi per vedere se ci sono ore in cui le prenotazioni sono più frequenti.
Soluzione:
---
SELECT HOUR(created_at), COUNT(*)
FROM prenotazioni
GROUP BY HOUR(created_at)
---

JOIN
    • Come si chiamano gli ospiti che hanno fatto più di due prenotazioni? (TRALASCIARE)
Soluzione:
---

---
    • Stampare tutti gli ospiti per ogni prenotazione.
Soluzione:
---

---
    • Stampare Nome, Cognome, Prezzo e Pagante per tutte le prenotazioni fatte a Maggio 2018.
Soluzione:
---

---
    • Fai la somma di tutti i prezzi delle prenotazioni per le stanze del primo piano.
Soluzione:
---

---
    • Prendi i dati di fatturazione per la prenotazione con id=7.
Soluzione:
---

---
    • Le stanze sono state tutte prenotate almeno una volta? (Visualizzare le stanze non ancora prenotate).
Soluzione:
---

---