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
    -- • Come si chiamano gli ospiti che hanno fatto più di due prenotazioni? (HAVING, da vedere lunedì a lezione)
Soluzione:
---
SELECT ospiti.name, ospiti.lastname, COUNT(ospiti.id) AS "# PRENOTAZIONI"
FROM prenotazioni_has_ospiti
JOIN ospiti
ON prenotazioni_has_ospiti.ospite_id = ospiti.id
GROUP BY prenotazioni_has_ospiti.ospite_id
HAVING COUNT(ospiti.id) > 2
---
    -- • Stampare tutti gli ospiti per ogni prenotazione.
Soluzione:
---
SELECT prenotazioni.*, ospiti.name, ospiti.lastname
FROM prenotazioni
JOIN prenotazioni_has_ospiti
ON prenotazioni.id = prenotazioni_has_ospiti.prenotazione_id
JOIN ospiti
ON prenotazioni_has_ospiti.ospite_id = ospiti.id
---
    -- • Stampare Nome, Cognome, Prezzo e Pagante per tutte le prenotazioni fatte a Maggio 2018.
Soluzione:
---
SELECT paganti.name, paganti.lastname, pagamenti.price, prenotazioni.created_at
FROM prenotazioni
JOIN pagamenti
ON prenotazioni.id = pagamenti.prenotazione_id
JOIN paganti
ON pagamenti.pagante_id = paganti.id
WHERE MONTH(prenotazioni.created_at) = 5
---
    -- • Fai la somma di tutti i prezzi delle prenotazioni per le stanze del primo piano.
Soluzione:
---
SELECT SUM(pagamenti.price)
FROM pagamenti
JOIN prenotazioni
ON pagamenti.prenotazione_id = prenotazioni.id
JOIN stanze
ON prenotazioni.stanza_id = stanze.id
WHERE stanze.floor = 1
---
    -- • Prendi i dati di fatturazione per la prenotazione con id=7.
Soluzione:
---
SELECT prenotazioni.id, paganti.name, paganti.lastname, paganti.address, pagamenti.status, pagamenti.price
FROM paganti
JOIN pagamenti
ON paganti.id = pagamenti.pagante_id
JOIN prenotazioni
ON pagamenti.prenotazione_id = prenotazioni.id
WHERE prenotazioni.id = 7
---
    -- • Le stanze sono state tutte prenotate almeno una volta? (Visualizzare le stanze non ancora prenotate).
Soluzione:
---
SELECT stanze.*
FROM stanze
LEFT JOIN prenotazioni
ON stanze.id = prenotazioni.stanza_id
WHERE prenotazioni.stanza_id IS NULL
---
