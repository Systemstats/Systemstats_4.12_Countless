<hr />
<h1> Verksamhetens samtliga datorer | <a class="btn btn-success" role="button" href="data/Systemstats.csv">DB-Fil</a> | 
</a> <button type="button" onclick="javascript:tbl2show()" class="btn btn-primary">Visa Tabell</button> | 
<button type="button" onclick="javascript:tbl2hide()" class="btn btn-danger">Dölj Tabell</button> |  
<div class="form-inline"> 
	<input  type="text" style="width:320px;" name="search" id="search" class="form-control" placeholder="Sök">
	<button style="margin-left: 5px;"  type="button"  class="btn btn-info mb-2" id="myBtn">Anpassa tabell</button>
	<button class="btn btn-success mb-2" type="button" id="countTableVisable">Räkna antal</button>
	<script>
		let countTableVisable = document.getElementById("countTableVisable");
		countTableVisable.addEventListener("click", () => {
			countTableVisable.innerHTML = `Räkna antal: ${(document.querySelectorAll(`#maintbl > tr:not([style="display: none;"])`)).length}`
		})
	</script>
</div> 
</h1> 
<script src="scripts/printName_Dymo.js">
</script>
<script src="scripts/printName_Leitz.js">
</script>
<script src="scripts/printDatorSpec.js">
</script>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title" style="color:black;">Välj kolumner</h3>
        </div>
        <div style="color:black" class="modal-body">
          
       <div id="grpChkBox">
      
      <div><label for="option1"><input type="checkbox" name="start" id="option1" data-control-column="1" class="opt" /> Startad</label> </div>  
      <div><label for="option2"><input type="checkbox" name="startTime" id="option2" data-control-column="2" class="opt" /> Starttid</label></div>
      <div><label for="option3"><input type="checkbox" name="login" id="option3" data-control-column="3" class="opt" /> Inloggad</label></div>
      <div><label for="option4"><input type="checkbox" name="loginTime" id="option4" data-control-column="4" class="opt" /> Inloggningstid</label></div>
      <div><label for="option5"><input type="checkbox" name="user" id="option5" data-control-column="5" class="opt"/> Användare</label></div>
      <div><label for="option6"><input type="checkbox" name="adKonto" id="option6" data-control-column="6" class="opt"/> AD-konto</label></div>
      <div><label for="option7"><input type="checkbox" name="ank" id="option7" data-control-column="7" class="opt"/> Ank</label></div>
      <div><label for="option8"><input type="checkbox" name="datorNamn" id="option8" data-control-column="8" class="opt"/> Datornamn</label></div>
      <div><label for="option9"><input type="checkbox" name="modell" id="option9" data-control-column="9" class="opt"/> Modell</label></div>
      <div><label for="option10"><input type="checkbox" name="serienummer" id="option10" data-control-column="10" class="opt"/> Serienummer</label></div>
      <div><label for="option11"><input type="checkbox" name="OS" id="option11" data-control-column="11" class="opt"/> OS</label></div>
      <div><label for="option12"><input type="checkbox" name="MBDisk" id="option12" data-control-column="12" class="opt"/> MB kvar C:</label></div>        
      <div><label for="option13"><input type="checkbox" name="installerad" id="option13" data-control-column="13" class="opt"/> Installerad</label></div>
      <div><label for="option14"><input type="checkbox" name="office" id="option14" data-control-column="14" class="opt"/> Office</label></div>
      <div><label for="option17"><input type="checkbox" name="buy" id="option17" data-control-column="15" class="opt"/> Inköpt </label></div>
      <div><label for="option19"><input type="checkbox" name="stold" id="option19" data-control-column="16" class="opt"/> Stöld nr</label></div>
      <div><label for="option20"><input type="checkbox" name="ram" id="option20" data-control-column="17" class="opt"/> Ram</label></div>
      <div><label for="option21"><input type="checkbox" name="CPU" id="option21" data-control-column="18" class="opt"/> CPU</label></div>
      <div><label for="option22"><input type="checkbox" name="karnor" id="option22" data-control-column="19" class="opt"/> Kärnor</label></div>
      <div><label for="option23"><input type="checkbox" name="tradar" id="option23" data-control-column="20" class="opt"/> Trådar</label></div>

      </div>
        </div>
        <div class="modal-footer">
        <button style="float:left;" class="btn btn-default" onclick="set(true)">Standard</button> 
       <button style="float:left;" class="btn btn-default" onclick="mark(true)">Fullständig</button> 
       <button style="float:left;" class="btn btn-default" onclick="mark(false)">Avmarkera alla</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Stäng</button>
        </div>
      </div>
      
    </div>
  </div>
  <script>

function set(checked) {
    var elm = document.querySelector("#option1");
    var elm2 = document.querySelector("#option2");
    var elm3 = document.querySelector("#option3");
    var elm4 = document.querySelector("#option4");
    var elm5 = document.querySelector("#option5");
    var elm6 = document.querySelector("#option6");
    var elm7 = document.querySelector("#option7");
    var elm8 = document.querySelector("#option8");
    var elm9 = document.querySelector("#option9");
    var elm10 = document.querySelector("#option10");
    var elm11 = document.querySelector("#option11");
    var elm12 = document.querySelector("#option12");
    var elm13 = document.querySelector("#option17");
    var elm14 = document.querySelector("#option19");

    if (checked != elm.checked) {
        elm.click();
    }
    if (checked != elm2.checked) {
        elm2.click();
    }
    if (checked != elm3.checked) {
        elm3.click();
    }
    if (checked != elm4.checked) {
        elm4.click();
    }
    if (checked != elm5.checked) {
        elm5.click();
    }
    if (checked != elm6.checked) {
        elm6.click();
    }
    if (checked != elm7.checked) {
        elm7.click();
    }
    if (checked != elm8.checked) {
        elm8.click();
    }
    if (checked != elm9.checked) {
        elm9.click();
    }
    if (checked != elm10.checked) {
        elm10.click();
    }
    if (checked != elm11.checked) {
        elm11.click();
    }
    if (checked != elm12.checked) {
        elm12.click();
    }
    if (checked != elm13.checked) {
        elm13.click();
    }
    if (checked != elm14.checked) {
        elm14.click();
    }
}
/**
 * @params checked {Boolean} Boolean
 */
function mark(checked) {
    var elm = document.querySelector("#option1");
    var elm2 = document.querySelector("#option2");
    var elm3 = document.querySelector("#option3");
    var elm4 = document.querySelector("#option4");
    var elm5 = document.querySelector("#option5");
    var elm6 = document.querySelector("#option6");
    var elm7 = document.querySelector("#option7");
    var elm8 = document.querySelector("#option8");
    var elm9 = document.querySelector("#option9");
    var elm10 = document.querySelector("#option10");
    var elm11 = document.querySelector("#option11");
    var elm12 = document.querySelector("#option12");
    var elm13 = document.querySelector("#option13");
    var elm14 = document.querySelector("#option14");
    var elm17 = document.querySelector("#option17");
    var elm19 = document.querySelector("#option19");
    var elm20 = document.querySelector("#option20");
    var elm21 = document.querySelector("#option21");
    var elm22 = document.querySelector("#option22");
    var elm23 = document.querySelector("#option23");

    if (checked != elm.checked) {
        elm.click();
    }
    if (checked != elm2.checked) {
        elm2.click();
    }
    if (checked != elm3.checked) {
        elm3.click();
    }
    if (checked != elm4.checked) {
        elm4.click();
    }
    if (checked != elm5.checked) {
        elm5.click();
    }
    if (checked != elm6.checked) {
        elm6.click();
    }
    if (checked != elm7.checked) {
        elm7.click();
    }
    if (checked != elm8.checked) {
        elm8.click();
    }
    if (checked != elm9.checked) {
        elm9.click();
    }
    if (checked != elm10.checked) {
        elm10.click();
    }
    if (checked != elm11.checked) {
        elm11.click();
    }
    if (checked != elm12.checked) {
        elm12.click();
    }
    if (checked != elm13.checked) {
        elm13.click();
    }
    if (checked != elm14.checked) {
        elm14.click();
    }
    if (checked != elm17.checked) {
        elm17.click();
    }
    if (checked != elm19.checked) {
        elm19.click();
    }
    if (checked != elm20.checked) {
        elm20.click();
    }
    if (checked != elm21.checked) {
        elm21.click();
    }
    if (checked != elm22.checked) {
        elm22.click();
    }
    if (checked != elm23.checked) {
        elm23.click();
    }
}



</script>
  


<script>
$(document).ready(function(){
  $("#myBtn").click(function(){
    $("#myModal").modal();
  });
});
</script>

<div id="tbl2">

<div id="ADM">
<script type="text/javascript">
	$(document).ready(function() { $(".tbl-adm").tablesorter(); }); 
</script>

<?Php  // Hämta Systemstats.csv data och lägg i tabell, bygg tabell utifrån $tabell
       // echo "<table border=1>";
echo $tabellADM;
$f = fopen("data/Systemstats.csv", "r");
$fr = fread($f, filesize("data/Systemstats.csv"));
fclose($f);
$lines = array();
$lines = explode("\r\n",$fr); // IMPORTANT the delimiter here just the "new line" \r\n.  

for($i=0;$i<count($lines);$i++)
{
    echo "<tr>";
    $cells = array(); 
    $cells = explode(";",$lines[$i]); // use the cell/row delimiter what u need!
    for($k=0;$k<count($cells);$k++)
    {
       echo "<span >".$cells[$k]."</span>";
    }
    // Avsluta rad ?for k end
    echo "</tr>";
}
// Avsluta tabell 
echo "</tbody></table>";
?> 
</div>

<script>
// "data-control-column" is a custom data attrubute added to the html checkboxes
// when a check box changes loop through all, for any that are unchecked, add that checkbox's "data-control-column" value to our array
// Listen for click on toggle checkbox
function toggle(source) {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i] != source)
            checkboxes[i].checked = source.checked;
    }
}

$('.opt').change(function(){ 
    var states = [];
    $('.opt').each(function(){
            if(!$(this).is(':checked')) 
                states.push($(this).data('control-column'));         
    });
    setSates(states);
});

// when we need to set the sate of the UI, loop through the checkboxes checking if their "data-control-column" are in the "states" array 
// if so, hide the specified column and uncheck the box
function setSates(states){
     if(states){
         if(!$.isArray( states )) states = JSON.parse(states); // if sates came from localstorage it will be a string, convert it to an array
         $('.opt').each(function(i,e){ 
             var column =$(this).data('control-column');
             if($.inArray( column, states ) == -1){
                 $(this).attr('checked', true);
                 $('#myTable td:nth-child('+column+'), #myTable th:nth-child('+column+')').show();
             }
             else{
                 $(this).attr('checked', false);
                 $('#myTable td:nth-child('+column+'), #myTable th:nth-child('+column+')').hide(); 
             }
         });
         localStorage.setItem('states', JSON.stringify(states));
     }
}
// this will read and set the initial states when the page loads
setSates( localStorage.getItem('states') );
</script>

</div>

</div>
<hr />
<h1> Specialdatorer & servrar | <a class="btn btn-success" role="button" href="data/Special.csv">DB-Fil</a>  </a> |  <button type="button" onclick="javascript:tbl3show()" class="btn btn-primary">Visa Tabell</button> | <button type="button" onclick="javascript:tbl3hide()" class="btn btn-danger">Dölj Tabell</button> </h1> 


<table>
<tr>
<td>
<div id="tbl3">

<div id="special" style="padding-bottom:15px;">
<script type="text/javascript">
	$(document).ready(function() { $(".tbl-special").tablesorter(); }); 
</script>


<?Php  // Hämta Special.csv data och lägg i tabell, bygg tabell utifrån $tabell
       // echo "<table border=1>";
echo $tabellSpesh;
$f = fopen("data/Special.csv", "r");
$fr = fread($f, filesize("data/Special.csv"));
fclose($f);
$lines = array();
$lines = explode("\r\n",$fr); // IMPORTANT the delimiter here just the "new line" \r\n.  

for($i=0;$i<count($lines);$i++)
{
    echo "<tr>";
    $cells = array(); 
    $cells = explode(";",$lines[$i]); // use the cell/row delimiter what u need!
    for($k=0;$k<count($cells);$k++)
    {
       echo "<td>".$cells[$k]."</td>";
    }
    // Avsluta rad ?for k end
    echo "</tr>";
}
// Avsluta tabell 
echo "</tbody></table>";
?> 
</div>


</td>
<td rowspan="1">
<div id="ansvar">
<div class="notes" style="padding-left:15px;padding-top:0px;"> 
<pre style="background-color:#339966;height:300px;width:400px;">
<?php  include('data/bbs/Ansvar.txt');   ?>

</pre>
</div>
</div>
</td>

<td rowspan="1">
<div id="nummer">
<div class="notes" style="padding-left:15px;padding-top:0px;"> 
<pre style="background-color:#A94DFF;height:300px;width:400px;">
<?php  include('data/bbs/Nummer.txt');   ?>

</pre>
</div>
</div>
</td>



</tr>
<tr>


<td>
<div id="ipdoc">
<div class="notes" style="padding-left:0px;padding-top:0px;"> 
<pre style="background-color:lightgrey;height:230px;width:1100px;">
<?php  include('data/bbs/IPDOC.txt');   ?>

</pre>
</div>
</div>


</td>
<td>
<div class="notes"  style="padding-left:15px;padding-top:0px; float:left;">
<pre style="background-color:lightpink;height:300px;width:400px;">
<?php  include('data/bbs/Pink.txt');   ?>

</pre>
</div>

</td>
<td rowspan="1">
<div id="receptionen">
<div class="notes" style="padding-left:15px;padding-top:0px;"> 
<pre style="background-color:#1b7fcf;height:300px;width:400px;">
<?php  include('data/bbs/Receptionen.txt');   ?>

</pre>
</div>
</div>
</td>
</tr>
</table>
