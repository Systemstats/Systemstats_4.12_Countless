
/**
* @param {String} datornNamn Dator namnet.
* @description Printar en letiz etikett för en dator som ska skrotas.
*/
function printDatorSpec(datornNamn)
{
	let trChildren = document.querySelector('#maintbl').children;
	for(var i = 0; i < trChildren.length; i++)
	{
		if(trChildren[i].childNodes[7].innerText.includes(datornNamn))
		{
			console.log(`Found pc: ${datornNamn}`);
			let currentPc = (number) => trChildren[i].childNodes[number];
			let model = currentPc(8).innerText;
			let serienummer = currentPc(9).innerText;
			let host = currentPc(7).innerText;
			let ram = currentPc(19).innerText;
			let hdd = currentPc(11).children[0].title.split('Total diskstorlek: ')[1];
			let fourG = currentPc(7).children[1].title ? 
												currentPc(7).children[1].title.includes('WWAN-stöd') ? 
													true : currentPc(7).children[1].title.includes('Datorn har en fellogg!') ?
														currentPc(7).children[2].title.includes('WWAN-stöd') : false /* for Datorn har en fellogg!*/ : false //<-- For first ?;
			let ink = currentPc(16).innerText;
			let cpu = currentPc(20).innerText;

			let PC_Spec_Leitz = 
`<?xml version="1.0" encoding="utf-8"?>
<DieCutLabel xml:space="preserve" labelversion="3.0" platform="Win" osversion="10.0.18363" build="3.1.3675.0">
  <Id category="Address">InternationalAddressLabel</Id>
  <Orientation>Landscape</Orientation>
  <Automation>
    <ScreenLogo />
    <ScreenTitle />
    <ScreenLogoScaleMode>None</ScreenLogoScaleMode>
    <AutomationActions />
    <ScreenColor Alpha="0" Red="0" Green="0" Blue="0" />
  </Automation>
  <Shape>
    <Rectangle Left="0" Top="0" Width="4989" Height="2041" RadiusX="181" RadiusY="181" />
  </Shape>
  <LabelElements>
    <AddressData>
      <Id>ADDRESS</Id>
      <Left>192</Left>
      <Top>674</Top>
      <Width>4603</Width>
      <Height>1294</Height>
      <Reflected>false</Reflected>
      <Editable>true</Editable>
      <HorizontalAlignment>Left</HorizontalAlignment>
      <VerticalAlignment>Center</VerticalAlignment>
      <BarcodePosition>BelowAddress</BarcodePosition>
      <RotateAngle>Angle0</RotateAngle>
      <ScalingMode>ShrinkToFit</ScalingMode>
      <TextElements>
        <TextInfo>
          <Text>Modell</Text>
          <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
          <Font Family="Century Gothic" Size="13" Bold="true" Italic="false" Underline="false" Strikeout="false" />
        </TextInfo>
        <TextInfo>
          <Text>: ${model}     </Text>
          <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
          <Font Family="Century Gothic" Size="13" Bold="false" Italic="false" Underline="false" Strikeout="false" />
        </TextInfo>
        <TextInfo>
          <Text>Host</Text>
          <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
          <Font Family="Century Gothic" Size="13" Bold="true" Italic="false" Underline="false" Strikeout="false" />
        </TextInfo>
        <TextInfo>
          <Text>: ${host}
</Text>
          <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
          <Font Family="Century Gothic" Size="13" Bold="false" Italic="false" Underline="false" Strikeout="false" />
        </TextInfo>
        <TextInfo>
          <Text>RAM</Text>
          <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
          <Font Family="Century Gothic" Size="13" Bold="true" Italic="false" Underline="false" Strikeout="false" />
        </TextInfo>
        <TextInfo>
          <Text>: ${ram}  </Text>
          <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
          <Font Family="Century Gothic" Size="13" Bold="false" Italic="false" Underline="false" Strikeout="false" />
        </TextInfo>
        <TextInfo>
          <Text>HDD</Text>
          <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
          <Font Family="Century Gothic" Size="13" Bold="true" Italic="false" Underline="false" Strikeout="false" />
        </TextInfo>
        <TextInfo>
          <Text>: ${hdd}  </Text>
          <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
          <Font Family="Century Gothic" Size="13" Bold="false" Italic="false" Underline="false" Strikeout="false" />
        </TextInfo>
        <TextInfo>
          <Text>4G</Text>
          <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
          <Font Family="Century Gothic" Size="13" Bold="true" Italic="false" Underline="false" Strikeout="false" />
        </TextInfo>
        <TextInfo>
          <Text>: ${fourG ? 'Ja' : 'Nej'}  </Text>
          <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
          <Font Family="Century Gothic" Size="13" Bold="false" Italic="false" Underline="false" Strikeout="false" />
        </TextInfo>
        <TextInfo>
          <Text>Ink</Text>
          <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
          <Font Family="Century Gothic" Size="13" Bold="true" Italic="false" Underline="false" Strikeout="false" />
        </TextInfo>
        <TextInfo>
          <Text>: ${ink}
</Text>
          <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
          <Font Family="Century Gothic" Size="13" Bold="false" Italic="false" Underline="false" Strikeout="false" />
        </TextInfo>
        <TextInfo>
          <Text>CPU</Text>
          <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
          <Font Family="Century Gothic" Size="13" Bold="true" Italic="false" Underline="false" Strikeout="false" />
        </TextInfo>
        <TextInfo>
          <Text>:   ${cpu} 
</Text>
          <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
          <Font Family="Century Gothic" Size="13" Bold="false" Italic="false" Underline="false" Strikeout="false" />
        </TextInfo>
        <TextInfo>
          <Text>[   ] DBAN-raderad    [   ] BIOS-PW borttaget
</Text>
          <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
          <Font Family="Century Gothic" Size="13" Bold="true" Italic="false" Underline="false" Strikeout="false" />
        </TextInfo>
        <TextInfo>
          <Text>[   ] Tagen ur AD        [   ] Avyttrad i Hamster</Text>
          <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
          <Font Family="Century Gothic" Size="13" Bold="true" Italic="false" Underline="false" Strikeout="false" />
        </TextInfo>
      </TextElements>
    </AddressData>
    <BarcodeData>
      <Id>STRECKKOD</Id>
      <Type>Code128A</Type>
      <Left>636</Left>
      <Top>72</Top>
      <Width>3668</Width>
      <Height>640</Height>
      <Size>Medium</Size>
      <RotateAngle>Angle0</RotateAngle>
      <Editable>false</Editable>
      <HorizontalAlignment>Center</HorizontalAlignment>
      <TextAlignment>Bottom</TextAlignment>
      <TextInfo>
        <Text>${serienummer}</Text>
        <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
        <Font Family="Arial" Size="10" Bold="false" Italic="false" Underline="false" Strikeout="false" />
      </TextInfo>
    </BarcodeData>
  </LabelElements>
  <Type>Standard</Type>
  <LabelLength>0</LabelLength>
</DieCutLabel>`

			let hiddenDownloadA = document.createElement('a');
			hiddenDownloadA.href = 'data:text/csv;charset=utf-8-bom,' + encodeURI(PC_Spec_Leitz);  
			hiddenDownloadA.target = '_blank';  
			
			//Skapa filen
			hiddenDownloadA.download = `${host}.LeitzLbl`;
	
			//Klicka på filen så den installeras
			hiddenDownloadA.click();
		}
	}
}