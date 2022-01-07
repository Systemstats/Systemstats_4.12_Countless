<?php

// TBD: Move appstats code to here and include in systemstats_ui

?>
<!-- <div clas="fk_stats" style="font-family:Arial, Helvetica, sans-serif;"> -->
<font color="green">Mjukvara:</font>
	<br /><br />
	Operativsystem
	<br />
	<?php 
	
	$pathstats = "Data/Systemstats.csv"; 
	
	echo " Windows 10";
	echo " ≈ ";
	$win10 = substr_count(file_get_contents($pathstats), "Windows_10");
	$sum_totalw10 = $win10 / count($NumberOfADMcomputers);
	$sum_totalw10_final = substr($sum_totalw10, 2, 2);
	print ($sum_totalw10_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "Windows_10");
	echo " st";

	echo "<br><br>";
	
	
	echo " Versionsfördelning Windows 10";
	echo "<br>";
	
	
#	echo " Windows 10 1803";
#	$win101803 = substr_count(file_get_contents($pathstats), "Windows_10_1803");
#	$sum_totalw101803 = $win101803 / count($NumberOfADMcomputers);
#	$sum_totalw101803_final = substr($sum_totalw101803, 2, 2);
#	echo " - ";
#	echo substr_count(file_get_contents($pathstats), "Windows_10_1803");
#	echo " st";

#	echo "<br>";
	
#	echo " Windows 10 1809";
#	$win101809 = substr_count(file_get_contents($pathstats), "Windows_10_1809");
#	$sum_totalw101809 = $win101809 / count($NumberOfADMcomputers);
#	$sum_totalw101809_final = substr($sum_totalw101809, 2, 2);
#	echo " - ";
#	echo substr_count(file_get_contents($pathstats), "Windows_10_1809");
#	echo " st";

#	echo "<br>";
	
	echo " Windows 10 1903";
	$win101903 = substr_count(file_get_contents($pathstats), "Windows_10_1903");
	$sum_totalw101903 = $win101903 / count($NumberOfADMcomputers);
	$sum_totalw101903_final = substr($sum_totalw101903, 2, 2);
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "Windows_10_1903");
	echo " st";

	echo "<br>";
	
	echo " Windows 10 1909";
	$win101909 = substr_count(file_get_contents($pathstats), "Windows_10_1909");
	$sum_totalw101909 = $win101909 / count($NumberOfADMcomputers);
	$sum_totalw101909_final = substr($sum_totalw101909, 2, 2);
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "Windows_10_1909");
	echo " st";

	echo "<br>";
	
	echo " Windows 10 20H2";
	$win1020H2 = substr_count(file_get_contents($pathstats), "Windows_10_20H2");
	$sum_totalw1020H2 = $win1020H2 / count($NumberOfADMcomputers);
	$sum_totalw1020H2_final = substr($sum_totalw1020H2, 2, 2);
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "Windows_10_20H2");
	echo " st";

	echo "<br>";
	
	echo " Windows 10 21H2";
	$win1021H2 = substr_count(file_get_contents($pathstats), "Windows_10_21H2");
	$sum_totalw1021H2 = $win1021H2 / count($NumberOfADMcomputers);
	$sum_totalw1021H2_final = substr($sum_totalw1021H2, 2, 2);
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "Windows_10_21H2");
	echo " st";

	echo "<br>";
	
	?>
</h4>
</td>
<td valign="top">
<!--Lite statistik över Office-paket! Infört /MF170707-->
<h4>
	<br /><br />
	Office-paket
	<br />
	<?php 
	$pathstats = "Data/Systemstats.csv"; 
	
	echo " 2007";
	echo " ≈ ";
	$Office_2007 = substr_count(file_get_contents($pathstats), "Office 2007");
	$sum_Office_2007 = $Office_2007 / count($NumberOfADMcomputers);
	$sum_Office_2007_final = substr($sum_Office_2007, 2, 2);
	print ($sum_Office_2007_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "Office 2007");
	echo " st";
	
	echo "<br>";
	
	echo " 2016 (365) ";
	echo " ≈ ";
	$Office_2016 = substr_count(file_get_contents($pathstats), "Office 365");
	$sum_Office_2016 = $Office_2016 / count($NumberOfADMcomputers);
	$sum_Office_2016_final = substr($sum_Office_2016, 2, 2);
	print ($sum_Office_2016_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "Office 365");
	echo " st";
	?>
	
	<br /><br />
</h4>
</td>
</tr>

<tr>
<td width="350" valign="top">
<!--Lite statistik över datormodeller! Infört /MF170707-->
<h4>
	<font color="green">Hårdvara:</font>
	
	<br /><br />
	Datortyper
	<br />
	
	<?php 
	$pathstats = "Data/Systemstats.csv"; 
	
	echo "Bärbara & Plattor";
	echo " ≈ ";
	$BN200 = substr_count(file_get_contents($pathstats), ">BN200");
	$sum_BN200 = $BN200 / count($NumberOfADMcomputers);
	$sum_BN200_final = substr($sum_BN200, 2, 2);
	$sum_BN200_final_number = substr_count(file_get_contents($pathstats), ">BN200");
	$BA = substr_count(file_get_contents($pathstats), ">BA");
	$sum_BA = $BA / count($NumberOfADMcomputers);
	$sum_BA_final = substr($sum_BA, 2, 2);
	$sum_BN_BA = $sum_BN200_final + $sum_BA_final;
	print ($sum_BN_BA);
	echo "%";
	echo " - ";
	$sum_BA_final_number = substr_count(file_get_contents($pathstats), ">BA");
	$sum_BN_BA_final_number = $sum_BN200_final_number + $sum_BA_final_number;
	echo $sum_BN_BA_final_number;
	echo " st";
		
	echo "<br>";
	
	echo "Stationära & Workstation";
	echo " ≈ ";
	$WN200 = substr_count(file_get_contents($pathstats), ">WN200");
	$sum_WN200 = $WN200 / count($NumberOfADMcomputers);
	$sum_WN200_final = substr($sum_WN200, 2, 2);
	$sum_WN200_final_number = substr_count(file_get_contents($pathstats), ">WN200");
	$WA = substr_count(file_get_contents($pathstats), ">WA");
	$sum_WA = $WA / count($NumberOfADMcomputers);
	$sum_WA_final = substr($sum_WA, 2, 2);
	$sum_WN_WA = $sum_WN200_final + $sum_WA_final;
	print ($sum_WN_WA);
	echo "%";
	echo " - ";
	$sum_WA_final_number = substr_count(file_get_contents($pathstats), ">WA");
	$sum_WN_WA_final_number = $sum_WN200_final_number + $sum_WA_final_number;
	echo $sum_WN_WA_final_number;
	echo " st";
	
	?>
	
	<br /><br />
	Garantistatus
	<br />
	
	<?php 
	$pathstats = "Data/Systemstats.csv"; 
	
	echo "Gällande (yngre än 3 år)";
	echo " ≈ ";
	$Garantija = substr_count(file_get_contents($pathstats), "Garantija");
	$sum_Garantija = $Garantija / count($NumberOfADMcomputers);
	$sum_Garantija_final = substr($sum_Garantija, 2, 2);
	print ($sum_Garantija_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "Garantija");
	echo " st";
	
	echo "<br>";
	
	echo "Utgången (äldre än 3 år)";
	echo " ≈ ";
	$Garantinej = substr_count(file_get_contents($pathstats), "Garantinej");
	$sum_Garantinej = $Garantinej / count($NumberOfADMcomputers);
	$sum_Garantinej_final = substr($sum_Garantinej, 2, 2);
	print ($sum_Garantinej_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "Garantinej");
	echo " st";
	?>
	
	<br /><br />
	<?php 
	$pathstats = "Data/Systemstats.csv"; 
	echo "Bärbara";
	echo "<br>";
	
	echo " HP EliteBook 820 G1 ";
	echo " ≈ ";
	$HP_EliteBook_820_G1 = substr_count(file_get_contents($pathstats), "HP EliteBook 820 G1");
	$sum_HP_EliteBook_820_G1 = $HP_EliteBook_820_G1 / count($NumberOfADMcomputers);
	$sum_HP_EliteBook_820_G1_final = substr($sum_HP_EliteBook_820_G1, 2, 2);
	print ($sum_HP_EliteBook_820_G1_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP EliteBook 820 G1");
	echo " st";
	
	echo "<br>";
	
	echo " HP EliteBook 820 G2 ";
	echo " ≈ ";
	$HP_EliteBook_820_G2 = substr_count(file_get_contents($pathstats), "HP EliteBook 820 G2");
	$sum_HP_EliteBook_820_G2 = $HP_EliteBook_820_G2 / count($NumberOfADMcomputers);
	$sum_HP_EliteBook_820_G2_final = substr($sum_HP_EliteBook_820_G2, 2, 2);
	print ($sum_HP_EliteBook_820_G2_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP EliteBook 820 G2");
	echo " st";
	
	echo "<br>";
	
	echo " HP EliteBook 820 G3 ";
	echo " ≈ ";
	$HP_EliteBook_820_G3 = substr_count(file_get_contents($pathstats), "HP EliteBook 820 G3");
	$sum_HP_EliteBook_820_G3 = $HP_EliteBook_820_G3 / count($NumberOfADMcomputers);
	$sum_HP_EliteBook_820_G3_final = substr($sum_HP_EliteBook_820_G3, 2, 2);
	print ($sum_HP_EliteBook_820_G3_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP EliteBook 820 G3");
	echo " st";
	
	echo "<br>";
	
	echo " HP EliteBook 840 G3 ";
	echo " ≈ ";
	$HP_EliteBook_840_G3 = substr_count(file_get_contents($pathstats), "HP EliteBook 840 G3");
	$sum_HP_EliteBook_840_G3 = $HP_EliteBook_840_G3 / count($NumberOfADMcomputers);
	$sum_HP_EliteBook_840_G3_final = substr($sum_HP_EliteBook_840_G3, 2, 2);
	print ($sum_HP_EliteBook_840_G3_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP EliteBook 840 G3");
	echo " st";
	
	echo "<br>";	
	
	echo " HP EliteBook 840 G4 ";
	echo " ≈ ";
	$HP_EliteBook_840_G4 = substr_count(file_get_contents($pathstats), "HP EliteBook 840 G4");
	$sum_HP_EliteBook_840_G4 = $HP_EliteBook_840_G4 / count($NumberOfADMcomputers);
	$sum_HP_EliteBook_840_G4_final = substr($sum_HP_EliteBook_840_G4, 2, 2);
	print ($sum_HP_EliteBook_840_G4_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP EliteBook 840 G4");
	echo " st";
	
	echo "<br>";
	
	echo " HP EliteBook 830 G5 ";
	echo " ≈ ";
	$HP_EliteBook_830_G5 = substr_count(file_get_contents($pathstats), "HP EliteBook 830 G5");
	$sum_HP_EliteBook_830_G5 = $HP_EliteBook_830_G5 / count($NumberOfADMcomputers);
	$sum_HP_EliteBook_830_G5_final = substr($sum_HP_EliteBook_830_G5, 2, 2);
	print ($sum_HP_EliteBook_830_G5_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP EliteBook 830 G5");
	echo " st";
	
	echo "<br>";
	
	echo " HP EliteBook 840 G5 ";
	echo " ≈ ";
	$HP_EliteBook_840_G5 = substr_count(file_get_contents($pathstats), "HP EliteBook 840 G5");
	$sum_HP_EliteBook_840_G5 = $HP_EliteBook_840_G5 / count($NumberOfADMcomputers);
	$sum_HP_EliteBook_840_G5_final = substr($sum_HP_EliteBook_840_G5, 2, 2);
	print ($sum_HP_EliteBook_840_G5_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP EliteBook 840 G5");
	echo " st";
	
	echo "<br>";
	
	echo " HP EliteBook 830 G6 ";
	echo " ≈ ";
	$HP_EliteBook_830_G6 = substr_count(file_get_contents($pathstats), "HP EliteBook 830 G6");
	$sum_HP_EliteBook_830_G6 = $HP_EliteBook_830_G6 / count($NumberOfADMcomputers);
	$sum_HP_EliteBook_830_G6_final = substr($sum_HP_EliteBook_830_G6, 2, 2);
	print ($sum_HP_EliteBook_830_G6_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP EliteBook 830 G6");
	echo " st";
	
	echo "<br>";
	
	echo " HP EliteBook 840 G6 ";
	echo " ≈ ";
	$HP_EliteBook_840_G6 = substr_count(file_get_contents($pathstats), "HP EliteBook 840 G6");
	$sum_HP_EliteBook_840_G6 = $HP_EliteBook_840_G6 / count($NumberOfADMcomputers);
	$sum_HP_EliteBook_840_G6_final = substr($sum_HP_EliteBook_840_G6, 2, 2);
	print ($sum_HP_EliteBook_840_G6_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP EliteBook 840 G6");
	echo " st";
	
	echo "<br>";
	
	echo " HP EliteBook 840 G7 ";
	echo " ≈ ";
	$HP_EliteBook_840_G7 = substr_count(file_get_contents($pathstats), "HP EliteBook 840 G7");
	$sum_HP_EliteBook_840_G7 = $HP_EliteBook_840_G7 / count($NumberOfADMcomputers);
	$sum_HP_EliteBook_840_G7_final = substr($sum_HP_EliteBook_840_G7, 2, 2);
	print ($sum_HP_EliteBook_840_G7_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP EliteBook 840 G7");
	echo " st";
	
	echo "<br>";
	
	echo " HP EliteBook 840 G8 ";
	echo " ≈ ";
	$HP_EliteBook_840_G8 = substr_count(file_get_contents($pathstats), "HP EliteBook 840 G8");
	$sum_HP_EliteBook_840_G8 = $HP_EliteBook_840_G8 / count($NumberOfADMcomputers);
	$sum_HP_EliteBook_840_G8_final = substr($sum_HP_EliteBook_840_G8, 2, 2);
	print ($sum_HP_EliteBook_840_G8_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP EliteBook 840 G8");
	echo " st";
	
	echo "<br>";	
	
	echo " HP ZBook 14 G2 ";
	echo " ≈ ";
	$HP_ZBook_14_G2 = substr_count(file_get_contents($pathstats), "HP ZBook 14 G2");
	$sum_HP_ZBook_14_G2 = $HP_ZBook_14_G2 / count($NumberOfADMcomputers);
	$sum_HP_ZBook_14_G2_final = substr($sum_HP_ZBook_14_G2, 2, 2);
	print ($sum_HP_ZBook_14_G2_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP ZBook 14 G2");
	echo " st";
	
	echo "<br>";
	
	echo " HP ZBook 15 & 15u G3 ";
	echo " ≈ ";
	$HP_ZBook_15 = substr_count(file_get_contents($pathstats), "HP ZBook 15");
	$sum_HP_ZBook_15 = $HP_ZBook_15 / count($NumberOfADMcomputers);
	$sum_HP_ZBook_15_final = substr($sum_HP_ZBook_15, 2, 2);
	print ($sum_HP_ZBook_15_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP ZBook 15");
	echo " st";
	
	echo "<br>";
	
	echo " HP ZBook 14u G6 ";
	echo " ≈ ";
	$HP_ZBook_14u_G6 = substr_count(file_get_contents($pathstats), "HP ZBook 14u G6");
	$sum_HP_ZBook_14u_G6 = $HP_ZBook_14u_G6 / count($NumberOfADMcomputers);
	$sum_HP_ZBook_14u_G6_final = substr($sum_HP_ZBook_14u_G6, 2, 2);
	print ($sum_HP_ZBook_14u_G6_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP ZBook 14u G6");
	echo " st";
	
	echo "<br>";
	
	echo " HP ZBook Studio G5 ";
	echo " ≈ ";
	$HP_ZBook_Studio_G5 = substr_count(file_get_contents($pathstats), "HP ZBook Studio G5");
	$sum_HP_ZBook_Studio_G5 = $HP_ZBook_Studio_G5 / count($NumberOfADMcomputers);
	$sum_HP_ZBook_Studio_G5_final = substr($sum_HP_ZBook_Studio_G5, 2, 2);
	print ($sum_HP_ZBook_Studio_G5_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP ZBook Studio G5");
	echo " st";
	
	?>
</h4>
</td>
<td valign="top">
<h4>
	<br /><br />
	Lagersaldo
	<br />
	
	<?php 
	$pathstats = "Data/Systemstats.csv"; 
	$pathpublic = "Data/Public.csv"; 
	
	echo "Datorer i lager";
	echo " ≈ ";
	$LAGER = substr_count(file_get_contents($pathstats), "LAGER");
	$sum_LAGER = $LAGER / count($NumberOfADMcomputers);
	$sum_LAGER_final = substr($sum_LAGER, 2, 2);
	print ($sum_LAGER_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), ">LAGER");
	echo " st";
	
	echo "<br>";
	
	echo "Datorer för leverans";
	echo " ≈ ";
	$LEVERANS = substr_count(file_get_contents($pathstats), "LEVERANS");
	$sum_LEVERANS = $LEVERANS / count($NumberOfADMcomputers);
	$sum_LEVERANS_final = substr($sum_LEVERANS, 2, 2);
	print ($sum_LEVERANS_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), ">LEVERANS");
	echo " st";
	
	echo "<br>";
	
	echo "Lånedatorer inne";
	$INNE = substr_count(file_get_contents($pathpublic), "INNE");
	$sum_INNE = $INNE / count($NumberOfADMcomputers);
	$sum_INNE_final = substr($sum_INNE, 2, 2);
	echo " - ";
	echo substr_count(file_get_contents($pathpublic), ">INNE");
	$LANEDATOR = substr_count(file_get_contents($pathpublic), "Lånedator");
	$sum_LANEDATOR = $LANEDATOR / count($NumberOfADMcomputers);
	$sum_LANEDATOR_final = substr($sum_LANEDATOR, 2, 2);
	echo "/";
	echo substr_count(file_get_contents($pathpublic), "Lånedator");
	echo " st";
	
	echo "<br>";
	echo "<br>";
	
	echo "Avvikande ägandeform";
	echo "<br>";
	
	echo "Klient som tjänst";
	echo " ≈ ";
	$KST = substr_count(file_get_contents($pathstats), "KST");
	$sum_KST = $KST / count($NumberOfADMcomputers);
	$sum_KST_final = substr($sum_KST, 2, 2);
	print ($sum_KST_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), ";KST;");
	echo " st";
	
	echo "<br>";
	
	
	echo "Köp";
	echo " ≈ ";
	$KÖP = substr_count(file_get_contents($pathstats), "KÖP");
	$sum_KÖP = $KÖP / count($NumberOfADMcomputers);
	$sum_KÖP_final = substr($sum_KÖP, 2, 2);
	print ($sum_KÖP_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), ";KÖP;");
	echo " st";
	
	echo "<br>";
	
	?>
	
	<br />
	<?php 
	$pathstats = "Data/Systemstats.csv"; 
	echo "Stationära";
	echo "<br>";
		
	echo " HP EliteDesk 800 G1 SFF ";
	echo " ≈ ";
	$HP_EliteDesk_800_G1_SFF = substr_count(file_get_contents($pathstats), "HP EliteDesk 800 G1 SFF");
	$sum_HP_EliteDesk_800_G1_SFF = $HP_EliteDesk_800_G1_SFF / count($NumberOfADMcomputers);
	$sum_HP_EliteDesk_800_G1_SFF_final = substr($sum_HP_EliteDesk_800_G1_SFF, 2, 2);
	print ($sum_HP_EliteDesk_800_G1_SFF_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP EliteDesk 800 G1 SFF");
	echo " st";
	
	echo "<br>";
	
	echo " HP EliteDesk 800 G2 SFF ";
	echo " ≈ ";
	$HP_EliteDesk_800_G2_SFF = substr_count(file_get_contents($pathstats), "HP EliteDesk 800 G2 SFF");
	$sum_HP_EliteDesk_800_G2_SFF = $HP_EliteDesk_800_G2_SFF / count($NumberOfADMcomputers);
	$sum_HP_EliteDesk_800_G2_SFF_final = substr($sum_HP_EliteDesk_800_G2_SFF, 2, 2);
	print ($sum_HP_EliteDesk_800_G2_SFF_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP EliteDesk 800 G2 SFF");
	echo " st";
	
	echo "<br>";
	
	echo " HP EliteDesk 800 G3 SFF ";
	echo " ≈ ";
	$HP_EliteDesk_800_G3_SFF = substr_count(file_get_contents($pathstats), "HP EliteDesk 800 G3 SFF");
	$sum_HP_EliteDesk_800_G3_SFF = $HP_EliteDesk_800_G3_SFF / count($NumberOfADMcomputers);
	$sum_HP_EliteDesk_800_G3_SFF_final = substr($sum_HP_EliteDesk_800_G3_SFF, 2, 2);
	print ($sum_HP_EliteDesk_800_G3_SFF_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP EliteDesk 800 G3 SFF");
	echo " st";
	
	echo "<br>";
	
	echo " HP EliteDesk 800 G2 DM 35W ";
	echo " ≈ ";
	$HP_EliteDesk_800_G2_DM_35W = substr_count(file_get_contents($pathstats), "HP EliteDesk 800 G2 DM 35W");
	$sum_HP_EliteDesk_800_G2_DM_35W = $HP_EliteDesk_800_G2_DM_35W / count($NumberOfADMcomputers);
	$sum_HP_EliteDesk_800_G2_DM_35W_final = substr($sum_HP_EliteDesk_800_G2_DM_35W, 2, 2);
	print ($sum_HP_EliteDesk_800_G2_DM_35W_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP EliteDesk 800 G2 DM 35W");
	echo " st";
	
	echo "<br>";
	
	echo " HP EliteOne 800 G2 23-in Touch AiO ";
	echo " ≈ ";
	$HP_EliteOne_800_G2_23in_Touch_AiO = substr_count(file_get_contents($pathstats), "HP EliteOne 800 G2 23-in Touch AiO");
	$sum_HP_EliteOne_800_G2_23in_Touch_AiO = $HP_EliteOne_800_G2_23in_Touch_AiO / count($NumberOfADMcomputers);
	$sum_HP_EliteOne_800_G2_23in_Touch_AiO_final = substr($sum_HP_EliteOne_800_G2_23in_Touch_AiO, 2, 2);
	print ($sum_HP_EliteOne_800_G2_23in_Touch_AiO_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP EliteOne 800 G2 23-in Touch AiO");
	echo " st";
	
	echo "<br>";
	echo "<br>";
	
	echo "Workstation";
	echo "<br>";
	
	echo " HP Z240 Tower Workstation ";
	echo " ≈ ";
	$HP_Z240_Tower_Workstation = substr_count(file_get_contents($pathstats), "HP Z240 Tower Workstation");
	$sum_HP_Z240_Tower_Workstation = $HP_Z240_Tower_Workstation / count($NumberOfADMcomputers);
	$sum_HP_Z240_Tower_Workstation_final = substr($sum_HP_Z240_Tower_Workstation, 2, 2);
	print ($sum_HP_Z240_Tower_Workstation_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP Z240 Tower Workstation");
	echo " st";
	
	echo "<br>";
	
	echo "<br>";
	
	echo "Plattor";
	echo "<br>";
	
	echo " HP EliteBook x360 1030 G2 ";
	echo " ≈ ";
	$HP_EliteBook_x360_1030_G2 = substr_count(file_get_contents($pathstats), "HP EliteBook x360 1030 G2");
	$sum_HP_EliteBook_x360_1030_G2 = $HP_EliteBook_x360_1030_G2 / count($NumberOfADMcomputers);
	$sum_HP_EliteBook_x360_1030_G2_final = substr($sum_HP_EliteBook_x360_1030_G2, 2, 2);
	print ($sum_HP_EliteBook_x360_1030_G2_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP EliteBook x360 1030 G2");
	echo " st";
	
	echo "<br>";
	
	echo " HP Elite x2 1012 G1 ";
	echo " ≈ ";
	$HP_Elite_x2_1012_G1 = substr_count(file_get_contents($pathstats), "HP Elite x2 1012 G1");
	$sum_HP_Elite_x2_1012_G1 = $HP_Elite_x2_1012_G1 / count($NumberOfADMcomputers);
	$sum_HP_Elite_x2_1012_G1_final = substr($sum_HP_Elite_x2_1012_G1, 2, 2);
	print ($sum_HP_Elite_x2_1012_G1_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "HP Elite x2 1012 G1");
	echo " st";
	
	echo "<br>";
	
	echo " Microsoft Surface Pro 3 ";
	echo " ≈ ";
	$Surface_Pro_3 = substr_count(file_get_contents($pathstats), "Surface Pro 3");
	$sum_Surface_Pro_3 = $Surface_Pro_3 / count($NumberOfADMcomputers);
	$sum_Surface_Pro_3_final = substr($sum_Surface_Pro_3, 2, 2);
	print ($sum_Surface_Pro_3_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "Surface Pro 3");
	echo " st";	
	
	echo "<br>";
	
	echo " Panasonic Toughpad FZG1-2 ";
	echo " ≈ ";
	$FZG12 = substr_count(file_get_contents($pathstats), "FZG1-2");
	$sum_FZG12 = $FZG12 / count($NumberOfADMcomputers);
	$sum_FZG12_final = substr($sum_FZG12, 2, 2);
	print ($sum_FZG12_final);
	echo "%";
	echo " - ";
	echo substr_count(file_get_contents($pathstats), "FZG1-2 ");
	echo " st";	
	
	?>
</h4>
<br />
</td>
</tr>
</table>
