Studente : Marco Longo
Esercizio Database Hotel 10.09.20 (Boolean Careers):

GOAL: produrre le query per rispondere alle seguenti interrogazioni.

    • Seleziona tutti gli ospiti che sono stati identificati con la carta di identità.
Soluzione:
---
SELECT *
FROM ospiti
WHERE document_type LIKE 'CI'
---
    • Seleziona tutti gli ospiti che sono nati dopo il 1988.
Soluzione:
---
SELECT *
FROM ospiti
WHERE YEAR(date_of_birth) > 1988
---
    • Seleziona tutti gli ospiti che hanno più di 20 anni (al momento dell'esecuzione della query).
Soluzione:
---
SELECT *
FROM ospiti
WHERE YEAR(NOW()) - YEAR(date_of_birth) > 20
---
    • Seleziona tutti gli ospiti il cui nome inizia con la D.
Soluzione:
---
SELECT *
FROM ospiti
WHERE name LIKE 'D%'
---
    • Calcola il totale degli ordini accepted.
Soluzione:
---
SELECT status, SUM(price)
FROM pagamenti
WHERE status LIKE 'accepted'
GROUP BY status
---
    • Qual è il prezzo massimo pagato?
Soluzione:
---
SELECT MAX(price)
FROM pagamenti
---
    • Seleziona gli ospiti riconosciuti con patente e nati nel 1975.
Soluzione:
---
SELECT *
FROM ospiti
WHERE document_type LIKE 'Driver License' AND (YEAR(date_of_birth) = 1975)
---
    • Quanti posti letto ha l'hotel in totale?
Soluzione:
---
SELECT SUM(beds)
FROM stanze
---
