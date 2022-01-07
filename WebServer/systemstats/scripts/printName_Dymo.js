/**
*@params {String} name Namnet på personen
*@description För att kunna skriva ut namnetiketter
*/
function printNameDymo(name)
{
	        let dymo =
`<?xml version="1.0" encoding="utf-8"?>
<ContinuousLabel Version="8.0" Units="twips">
	<PaperOrientation>Landscape</PaperOrientation>
	<Id>Tape12mm</Id>
	<PaperName>12mm</PaperName>
	<LengthMode>Auto</LengthMode>
	<LabelLength>0</LabelLength>
	<RootCell>
		<TextObject>
			<Name>TEXT</Name>
			<ForeColor Alpha="255" Red="0" Green="0" Blue="0" />
			<BackColor Alpha="0" Red="255" Green="255" Blue="255" />
			<LinkedObjectName />
			<Rotation>Rotation0</Rotation>
			<IsMirrored>False</IsMirrored>
			<IsVariable>True</IsVariable>
			<GroupID>-1</GroupID>
			<IsOutlined>False</IsOutlined>
			<HorizontalAlignment>Center</HorizontalAlignment>
			<VerticalAlignment>Middle</VerticalAlignment>
			<TextFitMode>AlwaysFit</TextFitMode>
			<UseFullFontHeight>True</UseFullFontHeight>
			<Verticalized>False</Verticalized>
			<StyledText>
				<Element>
					<String xml:space="preserve">${name}</String>
					<Attributes>
						<Font Family="Arial" Size="20" Bold="False" Italic="False" Underline="False" Strikeout="False" />
						<ForeColor Alpha="255" Red="0" Green="0" Blue="0" HueScale="100" />
					</Attributes>
				</Element>
			</StyledText>
		</TextObject>
		<Length>0</Length>
		<LengthMode>Auto</LengthMode>
		<BorderWidth>0</BorderWidth>
		<BorderStyle>Solid</BorderStyle>
		<BorderColor Alpha="255" Red="0" Green="0" Blue="0" />
	</RootCell>
</ContinuousLabel>`


        let hiddenElement = document.createElement('a');
        hiddenElement.href = 'data:text/csv;charset=utf-8-bom,' + encodeURI(dymo);
        hiddenElement.target = '_blank';
        
        //Skapa filen 
        hiddenElement.download = `${name}-Dymo.label`;

        //Klicka på filen så den installeras
        hiddenElement.click();
}