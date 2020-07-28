$incPath = dir -filter "*.h" -Recurse
$txtList="",""

foreach($fpath in $incPath)
{
    $txtList+=$fpath.DirectoryName
}

$txtTemp=$txtList[0]
$txtTemp
#$KeilOut="",""
$KeilOut="Keil include directories`n`n"
$workDir=get-location 
$workDir =$workDir -replace "\\","\\"
foreach($txt in $txtList)
{
    if($txt -ne $txtTemp)
    { 
        $txtTemp=$txt
        $txtTemp +=";"
        $KeilOut += $txtTemp -replace $workDir , "." 
        $txtTemp=$txt
    }
    
}
$IAROut="",""
$IAROut += "`nIAR include directories`n"
$txtTemp=$txtList[0]
foreach($txt in $txtList)
{
    if($txt -ne $txtTemp)
    { 
        $txtTemp=$txt    
        $IAROut += $txtTemp -replace $workDir , "`$PROJ_DIR$" 
    }
}
$KeilOut>incDir.txt
$IAROut>>incDir.txt