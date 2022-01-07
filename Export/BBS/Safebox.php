<?php
    require(__DIR__ . '/../../Safebox.php');
    if(SafeBox())
    {
?>
<font color="00FF00">#Access Granted!</font>
<br /><br />
Här lagras koder till lås, information om nycklar samt
<br />lösenord till olika system. Tänk på att hantera de här
<br />uppgifterna varsamt. Uppdateras från Systemstats Admin.
<br /><br />
<h4>--- <a href="#koder" style="color:#FFFFFF">Koder</a> --- <a href="#nycklar" style="color:#FFFFFF">Nycklar</a> --- <a href="#losen" style="color:#FFFFFF">Lösenord</a> --- <a href="#info" style="color:#FFFFFF">Info</a> ---</h4>
<br /><br />

<br /> <br />
<h4><a id="koder"></a>--- Koder ---</h4>

<br /><br />
<h4><a id="nycklar"></a>--- Nycklar ---</h4>

<br /><br />
<h4><a id="losen"></a>--- Lösenord ---</h4>

<br /><br />
<h4><a id="info"></a>--- Info ---</h4>

<?php
    }
?>