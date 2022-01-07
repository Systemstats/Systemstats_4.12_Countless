/**
*@params {String} name Namnet på personen
*@description För att kunna skriva ut namnetiketter
*/
function printNameLeitz(name)
{
	        let leitz =
`<?xml version="1.0" encoding="utf-8"?>
<DieCutLabel xml:space="preserve" labelversion="1.1" platform="Win" osversion="5.1.2600" build="2.2.3105.0">
  <Id category="Address">StandardAddressLabel</Id>
  <Orientation>Landscape</Orientation>
  <Automation>
    <ScreenLogo />
    <ScreenTitle />
    <ScreenLogoScaleMode>None</ScreenLogoScaleMode>
    <AutomationActions />
    <ScreenColor Alpha="0" Red="0" Green="0" Blue="0" />
  </Automation>
  <Shape>
    <Rectangle Left="0" Top="0" Width="4989" Height="1587" RadiusX="181" RadiusY="181" />
  </Shape>
  <LabelElements>
    <AddressData>
      <Id>ADDRESS</Id>
      <Left>373</Left>
      <Top>169</Top>
      <Width>4198</Width>
      <Height>1326</Height>
      <Reflected>false</Reflected>
      <Editable>true</Editable>
      <HorizontalAlignment>Left</HorizontalAlignment>
      <VerticalAlignment>Center</VerticalAlignment>
      <BarcodePosition>BelowAddress</BarcodePosition>
      <RotateAngle>Angle0</RotateAngle>
      <ScalingMode>ShrinkToFit</ScalingMode>
      <TextElements>
        <TextInfo>
          <Text>${name}</Text>
          <Foreground Alpha="255" Red="0" Green="0" Blue="0" />
          <Font Family="Latha" Size="36" Bold="false" Italic="false" Underline="false" Strikeout="false" />
        </TextInfo>
      </TextElements>
    </AddressData>
  </LabelElements>
  <Type>Standard</Type>
  <LabelLength>0</LabelLength>
</DieCutLabel>`


        let hiddenElement = document.createElement('a');  
        hiddenElement.href = 'data:text/csv;charset=utf-8-bom,' + encodeURI(leitz);  
        hiddenElement.target = '_blank';  
        
        //Skapa filen 
        hiddenElement.download = `${name}.LeitzLbl`;

        //Klicka på filen så den installeras
        hiddenElement.click();
}