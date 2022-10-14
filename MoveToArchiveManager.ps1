#Projektname: MoveToArchiveManager
#Lucca Finn Wicke
#
#Ziel: Nach der Bearbeitung sollen Videodateien bzw. der Projektordner für die Langzeitlagerung auf eine 
#externe Festplatte verschoben und im Quellordner danach gelöscht werden.
#Hierbei soll nocheinmal eine überprüfung stattfinden, ob der vorherige Kopiervorgang erfolgreich war. 

#1.Festlegen der Pfade als Variablen für eine bessere Übersicht und weniger Schreibarbeit

$PfadA= "C:\Users\admin\Documents\Pfad_A"
$PfadB= "C:\Users\admin\Documents\Pfad_B"

#1.1 Nutzer-Abfrage | Soll das Skript wirklich ausgeführt werden? 

#Anfangsabfrage "Dieses Programm kopiert alle Projektdateien in den Archiv-Ordner und löscht sie danach im Quellverzeichnis automatisch nach 10 Sekunden" 
#               "Zum Fortfahren drücken Sie bitte "Y"! 


#2.Nutzen von Robocopy um alle Dateien von Pfad A zu Pfad B zu transportieren 

robocopy $PfadA $PfadB Datei1.txt /z; 
# $LASTEXITCODE
 $KopierStatus= $LASTEXITCODE

if ($Kopierstatus -eq 1) {write "Das Kopieren wurde erfolgreich abgeschlossen!"
                            "In 10 Sekunden werden die Daten im Quellordner automatisch gelöscht!"}

if ($Kopierstatus  -eq 0) {write "Es wurde nichts kopiert!"}

if ($Kopierstatus -gt 1) {write "Beim Kopieren ist ein Fehler aufgetreten!"
                                "Der Fehlercode lautet: $Kopierstatus"}

#Was fehlt noch? 
#Anfangsabfrage "Dieses Programm kopiert alle Projektdateien in den Archiv-Ordner und löscht sie danach im Quellverzeichnis automatisch nach 10 Sekunden" 
#               "Zum Fortfahren drücken Sie bitte "Y"! 
                            
