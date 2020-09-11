-- Studente : Marco Longo
-- Esercizio Database Hotel - GROUP BY and JOIN 11.09.20 (Boolean Careers):

-- GOAL:

GROUP BY
    -- • Conta gli ospiti raggruppandoli per anno di nascita.
Soluzione:
---
SELECT YEAR(date_of_birth), COUNT(*)
FROM ospiti
GROUP BY YEAR(date_of_birth)
---
    -- • Somma i prezzi dei pagamenti raggruppandoli per status.
Soluzione:
---
SELECT status, SUM(price)
FROM pagamenti
GROUP BY status
---
    -- • Conta quante volte è stata prenotata ogni stanza.
Soluzione:
---
SELECT stanza_id, COUNT(*)
FROM prenotazioni
GROUP BY stanza_id
---
    -- • Fai una analisi per vedere se ci sono ore in cui le prenotazioni sono più frequenti.
Soluzione:
---
SELECT HOUR(created_at), COUNT(*)
FROM prenotazioni
GROUP BY HOUR(created_at)
---

JOIN
    -- • Come si chiamano gli ospiti che hanno fatto più di due prenotazioni? (TRALASCIARE)
Soluzione:
---

---
    -- • Stampare tutti gli ospiti per ogni prenotazione.
Soluzione:
---
SELECT prenotazioni_has_ospiti.prenotazione_id, ospiti.name, ospiti.lastname
FROM prenotazioni_has_ospiti
JOIN ospiti
ON prenotazioni_has_ospiti.ospite_id = ospiti.id
---
    -- • Stampare Nome, Cognome, Prezzo e Pagante per tutte le prenotazioni fatte a Maggio 2018.
Soluzione:
---
SELECT  prenotazioni.id,
        ospiti.name, ospiti.lastname,
        pagamenti.price,
        paganti.name, paganti.lastname, paganti.address,
		    prenotazioni.created_at
FROM prenotazioni_has_ospiti
LEFT JOIN prenotazioni
ON prenotazioni_has_ospiti.prenotazione_id = prenotazioni.id
LEFT JOIN ospiti
ON prenotazioni_has_ospiti.ospite_id = ospiti.id
LEFT JOIN pagamenti
ON pagamenti.prenotazione_id = prenotazioni.id
LEFT JOIN paganti
ON paganti.ospite_id = ospiti.id
WHERE YEAR(prenotazioni.created_at) = 2018 AND MONTH(prenotazioni.created_at) = 5
---
    -- • Fai la somma di tutti i prezzi delle prenotazioni per le stanze del primo piano.
Soluzione:
---

---
    -- • Prendi i dati di fatturazione per la prenotazione con id=7.
Soluzione:
---

---
    -- • Le stanze sono state tutte prenotate almeno una volta? (Visualizzare le stanze non ancora prenotate).
Soluzione:
---

---
