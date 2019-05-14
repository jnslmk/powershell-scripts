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
# Taken from https://stackoverflow.com/questions/6605006/convert-pdf-to-image-with-high-resolution
# -sharpen 0x1.0 after $in may improve output with text pdfs
magick -verbose -density 150 $in -trim -quality 100 -flatten $out
