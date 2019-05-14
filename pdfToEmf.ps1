param (
   [Parameter(Mandatory=$true)][string]$in
)
if (!(Test-Path $in)) {
   Write-Host "Script interrupted - File" $in "does not exist"
   exit 1
}

$in = Convert-Path $in

# Create output filename by changing extension
$newExtension = "emf"
$out = [io.path]::ChangeExtension($in, $newExtension)

Write-Host "Converting" $in "to" $newExtension ".."
# Using https://github.com/jalios/pdf2svg-windows
pdf2svg $in ~.svg
inkscape -T ~.svg --export-emf=$out
