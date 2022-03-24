$xmlWriter = New-Object System.XMl.XmlTextWriter('D:\contacts_new.xml',$Null)


$xmlWriter.Formatting = 'Indented'
$xmlWriter.Indentation = 1
$XmlWriter.IndentChar = "`t"
$xmlWriter.WriteStartDocument()

$xmlWriter.WriteStartElement('AddressBook')

$csv = Import-Csv "C:\Users\example\example\example.csv" -Delimiter "," -Encoding UTF8
$num = 0

foreach($stroke in $csv){
    
    Write-Output $stroke
    $num = $num + 1
    $xmlWriter.WriteStartElement('Contact')
    $xmlWriter.WriteElementString('id', $num)
    $xmlWriter.WriteElementString('LastName', $stroke.LastName)
    $xmlWriter.WriteElementString('FirstName', $stroke.FirstName)
    $xmlWriter.WriteElementString('Frequent', '0')
    $xmlWriter.WriteStartElement('Phone')
    $xmlWriter.WriteElementString('phonenumber', $stroke.Number)
    $xmlWriter.WriteElementString('accountindex', '1')
    $xmlWriter.WriteEndElement()
    $xmlWriter.WriteStartElement('Groups')
    $xmlWriter.WriteElementString('groupid', '6')
    $xmlWriter.WriteElementString('Primary', '0')
    $xmlWriter.WriteEndElement()
    $xmlWriter.WriteEndElement()

}

$xmlWriter.WriteEndDocument()
$xmlWriter.Flush()
$xmlWriter.Close()