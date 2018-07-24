$m4aFiles = Get-ChildItem -Recurse $pwd -include *.m4a

foreach ($item in $m4aFiles) {
    $out =  $item.DirectoryName + "\" + $item.BaseName + ".mp3"
    Write-Host Converting $item to mp3
    ffmpeg -i $item $out
    Remove-Item $item
}