param (
   [Parameter(Mandatory=$true)][string]$in
)
if (!(Test-Path $in)) {
   Write-Host "Script interrupted - File" $in "does not exist"
   exit 1
}
   
$in = Convert-Path $in

# Create output filename by changing extension
$newExtension = "pdf"
$out = [io.path]::ChangeExtension($in, $newExtension)

Write-Host "Converting" $in "to" $newExtension ".."
inkscape $in -z --export-area-drawing --export-pdf=$out
