function get-RedflagPages {
    
    param ($url = "http://forums.redflagdeals.com/hot-deals-f9/1/")
    $url
   
    $html = (Invoke-Webrequest $url)
    sleep -Milliseconds 2000
    $test = $html.parsedhtml


    $toParses = $test.getElementsByTagName('li') | ?{$_.classname -match "threadbit"} 

    foreach ($toparse in $toParses) {
        $DealURL = ""
        $DEalDetails = $toParse.innertext | %{($_ -split "`n").trim()} 
        $toparse.innerHTML -match "`<h3(.*)`<`/H3" | Out-Null
        $tmpDealURL = $Matches[1]
        $tmpDealURL -match "href=`"`/(.*)`/`"" | Out-Null
        [string]$DealURL = $Matches[1]
        $fullURL ="http://forums.redflagdeals.com/$DealURL"
        $DEalDetails[0]
        $fullURL
    
        # | %{$_ -split "`n"}
    }

}



$url = "http://forums.redflagdeals.com/hot-deals-f9/"
$url
$html = (Invoke-Webrequest $url)
sleep -Milliseconds 2000
$test = $html.parsedhtml

$ChknbPgresult = $test.getElementsByTagName('a') | ?{$_.id -match "yui-gen14" } 
$ChknbPgresult
$nbPgresult =(($ChknbPgresult | select -ExpandProperty textContent) -split " ")[-1]
$nbPgresult

for($i = 1; $i -eq $nbPgresult; $i++){
    
    $i
   # $url = "http://forums.redflagdeals.com/hot-deals-f9/$i"
   # $url
    # get-RedflagPages $url

  }
