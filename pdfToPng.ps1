param (
   [Parameter(Mandatory=$true)][string]$in
)
if (!(Test-Path $in)) {
   Write-Host "Script interrupted - File" $in "does not exist"
   exit 1
}
   
$in = Convert-Path $in

# Create output filename by changing extension
$newExtension = "png"
$out = [io.path]::ChangeExtension($in, $newExtension)

Write-Host "Converting" $in "to" $newExtension ".."
gswin64 -sDEVICE=pngalpha -o $out -r300 $in
