# Systemstats-4.12 "Countless" 

[https://systemstats.se](https://systemstats.se), demo av webbgränsnitt [https://demo.systemstats.se](https://demo.systemstats.se)

Varning! Denna kod är inte skriven för att vara säker out of the box, kunskaper i Active Directory och behörigheter i Windows krävs för att detta ska sättas upp på ett säkerhetsmässigt korrekt sätt. Mer dokumentation kommer publiceras löpande. 

Systemstats är ett modulärt ITAM-System (IT-Assets Management) byggt med Batcscript/VBScript/PowerShell och PHP/HTML. Utvecklingen 
av Systemstats startade 2016 på Göteborgs Stad - Fastighetskontoret, från början ett verktyg som inventerade uptime på alla förvaltnigens datorer så har med tiden fler funktioner och moduler tillkommit. Idag är Systemstats ett komplett ITAM-System som inventerar mjukvara och hårdvara med ett simpelt login script, bearbetar denna data och presenterar den i ett webbgränssnitt.

Sedan 2021 är Systemstats öppen källkod och utvecklas fristående på GitHub. Systemstats består av ett installationpaket som hjälper dig installera och konfigurera 3 moduler. 

<ul>
<li> Systemstats Server & Webbapp: Backend Script som genererar rapportfiler och datan som visas i webbgränssnittet. </li>
<li> Systemstats Login Script: Scriptet som körs på klienterna via autostart eller GPO. Detta inventerar mjukvaran och hårdvaran. </li>
<li> Systemstats Admin: Verktyg för IT-Personal för att snabbt uppdatera data i Systemstats, och lägga till samt ta bort klienter. </li>
</ul>

# Dokumentation 

## Installera Systemstats på en server. 

Kör SETUP.bat som administratör och följ instruktionerna. 

Se sedan dessa filer för att konfigurera Systemstats. 

[Install_STS_4.12.pdf](Install_STS_4.12.pdf) - Detaljerad guide med skärmdumpar för konfiguration och installation.

[Dok/AfterSetup.txt](Dok/AfterSetup.txt) - Konfiguration av miljön. 

[Dok/AfterSetup.txt](Dok/AfterSetup.txt) - Konfiguration av webbapplikation. 


## Licens
Dem flesta delar av Systemstats är släppta under GPL v2.0 licenas enskillda filer kan ha andra licenser detta framgår av kommentarer i headern på filen. 


## Screenshots

![](https://systemstats.se/img/web2.png)

![](https://systemstats.se/img/web3.png)

![](https://systemstats.se/img/web4.png)

![](https://systemstats.se/img/web1.png)

![](https://systemstats.se/img/SSA1.png)

![](https://systemstats.se/img/SSA2.png)
