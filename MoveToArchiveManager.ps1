#Projektname: MoveToArchiveManager
#Lucca Finn Wicke
#
#Ziel: Nach der Bearbeitung sollen Videodateien bzw. der Projektordner fÃƒÂ¼r die Langzeitlagerung auf eine 
#externe Festplatte verschoben und im Quellordner danach gelÃƒÂ¶scht werden.
#Hierbei soll nocheinmal eine ÃƒÂ¼berprÃƒÂ¼fung stattfinden, ob der vorherige Kopiervorgang erfolgreich war. 


#0.2 Wir holen uns den Scriptpfad und legen diesen als Quellverzeichnis fest

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition  


#0 Das Script stellt fest in welchem Pfad es sich befindet und speichert diesen als Variable 


get-location 

Split-Path -Path (Get-Location) -Leaf

$OrdnerName = Split-Path -Path (Get-Location) -Leaf

#Wir legen im Zielverzeichnis einen Ordner mit dem gleichen Namen wie dem Pfad an aus welchem wir kopieren 
New-Item -Path "E:\Archiv" -Name "$OrdnerName" -ItemType "directory"

cd E:\Archiv\$OrdnerName
get-location 
$neuerKopierPfad = get-location 






#1.Festlegen der Pfade als Variablen fÃƒÂ¼r eine bessere ÃƒÅ“bersicht und weniger Schreibarbeit

$PfadA= "$scriptpath"
$PfadB= "$neuerkopierpfad"

#1.1 Nutzer-Abfrage | Soll das Skript wirklich ausgefÃƒÂ¼hrt werden? 

#Anfangsabfrage "Dieses Programm kopiert alle Projektdateien in den Archiv-Ordner und lÃƒÂ¶scht sie danach im Quellverzeichnis automatisch nach 10 Sekunden" 
#               "Zum Fortfahren drÃƒÂ¼cken Sie bitte "Y"! 


#2.Nutzen von Robocopy um alle Dateien von Pfad A zu Pfad B zu transportieren 

robocopy $PfadA $PfadB  /MIR; 
# $LASTEXITCODE
 $KopierStatus= $LASTEXITCODE

if ($Kopierstatus -eq 1) {write "Das Kopieren wurde erfolgreich abgeschlossen!"
                            "In 10 Sekunden werden die Daten im Quellordner automatisch gelÃƒÂ¶scht!"}

if ($Kopierstatus  -eq 0) {write "Es wurde nichts kopiert!"}

if ($Kopierstatus -gt 1) {write "Beim Kopieren ist ein Fehler aufgetreten!"
                                "Der Fehlercode lautet: $Kopierstatus"}

#Was fehlt noch? 
#Anfangsabfrage "Dieses Programm kopiert alle Projektdateien in den Archiv-Ordner und lÃƒÂ¶scht sie danach im Quellverzeichnis automatisch nach 10 Sekunden" 
#               "Zum Fortfahren drÃƒÂ¼cken Sie bitte "Y"! 



New-Item -Path "$PfadA" -Name "Dieser Ordner wurde bereits kopiert.txt" -ItemType "file"

#Known-Issues

# Ordner darf keine Leerzeichen enthalten 
