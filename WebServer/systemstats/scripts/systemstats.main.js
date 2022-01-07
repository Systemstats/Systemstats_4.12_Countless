// systemstats.main.js
function InstallClient() {
    div = document.getElementById('clientinstall');
    div.style.display = 'block';
}
function HideInstallClient() {
    div = document.getElementById('clientinstall');
    div.style.display = 'none';
}
function ITDocs() {
    div = document.getElementById('docs');
    div.style.display = 'block';
}
function HideITDocs() {
    div = document.getElementById('docs');
    div.style.display = 'none';
}
function AlertUnderConstruction() {
     alert("Under Utveckling!");
}

function showHelpDiv() {
    div = document.getElementById('infobox-content');
    div.style.display = "block";
}
function HideHelpDiv() {
    div = document.getElementById('infobox-content');
    div.style.display = "none";
}
function showAppStats() {
    div = document.getElementById('appstats');
    div.style.display = "block";
}
function HideAppStats() {
    div = document.getElementById('appstats');
    div.style.display = "none";
}

function showSysReport() {
    div = document.getElementById('reports');
    div.style.display = "block";
}

function hideSysReport() {
    div = document.getElementById('reports');
    div.style.display = "none";
}

/* tabeller, visa/dölj i /systemstats_tabeller.php */
function tbl1show() {
    div = document.getElementById('tbl1');
    div.style.display = "block";
}
function tbl1hide() {
    div = document.getElementById('tbl1');
    div.style.display = "none";
}
function tbl2show() {
    div = document.getElementById('tbl2');
    div.style.display = "block";
}
function tbl2hide() {
    div = document.getElementById('tbl2');
    div.style.display = "none";
}

function tbl3show() {
    div = document.getElementById('tbl3');
    div.style.display = "block";
}

function tbl3hide() {
    div = document.getElementById('tbl3');
    div.style.display = "none";
}

function StartInventoryForm() {
    div = document.getElementById('inventory');
    div.style.display = 'block';
}

function hideInv() {
    div = document.getElementById('inventory');
    div.style.display = "none";
}


//Accounts
function PopupAccounts() {
	window.open("data/accounts/Accounts.txt", "_blank", "toolbar=yes,scrollbars=no,resizable=no,top=500,left=500,width=550,height=465"); 
}

//Accounts Disabled
function AccountsDisabled() {
	window.open("data/accounts/Accounts-Disabled.txt", "_blank", "toolbar=yes,scrollbars=no,resizable=no,top=500,left=500,width=650,height=465"); 
}

//Accounts Admin
function AccountsAdmin() {
	window.open("data/accounts/Accounts-Admin.txt", "_blank", "toolbar=yes,scrollbars=no,resizable=no,top=500,left=500,width=650,height=465"); 
}

//Accounts Plus
function AccountsPlus() {
	window.open("data/accounts/Accounts-Plus.txt", "_blank", "toolbar=yes,scrollbars=no,resizable=no,top=500,left=500,width=650,height=465"); 
}

//Computers
function Computers() {
	window.open("data/computers/Computers.txt", "_blank", "toolbar=yes,scrollbars=no,resizable=no,top=500,left=500,width=450,height=465"); 
}

//Computers Disabled
function ComputersD() {
	window.open("data/computers/Computers-Disabled.txt", "_blank", "toolbar=yes,scrollbars=no,resizable=no,top=500,left=500,width=650,height=465"); 
}

//Inventory
function PopUpInventory() {
	window.open("department_docs.php", "_blank", "toolbar=no,scrollbars=no,resizable=yes,top=500,left=500,width=550,height=565"); 
}
//Docs
function PopupITDocs() {
	window.open("department_docs.php", "_blank", "toolbar=no,scrollbars=no,resizable=yes,top=500,left=500,width=550,height=565"); 
}
//Öppnar search frame i ett nytt fönster!
function StartSerarchForm() {
	window.open("mod/search_frame.php", "_blank", "toolbar=no,scrollbars=no,resizable=no,top=500,left=500,width=450,height=465"); 
}
// Öppnar Konfigurations information i nytt fönster!
function StartConfigForm() {
	window.open("mod/show_config.php", "_blank", "toolbar=no,scrollbars=no,resizable=no,top=500,left=500,width=450,height=485"); 
}
//Help form
function StartHelpForm() {
	window.open("webhelp.php?htmlhelp=docs/systemstats_UI_tables.htm", "_blank", "toolbar=no,scrollbars=no,resizable=no,top=500,left=500,width=450,height=485"); 
}