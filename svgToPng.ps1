param (
   [Parameter(Mandatory=$true)][string]$in
)
if (!(Test-Path $in)) {
   Write-Host "Script interrupted - File" $in "does not exist"
   exit 1
}
   
$in = Convert-Path $in

if (!([IO.Path]::GetExtension($in) -eq ".svg")) {
   Write-Host "Script interrupted - Please provide a .svg-file"
   exit
}

# Create output filename by changing extension
$newExtension = "png"
$out = [io.path]::ChangeExtension($in, $newExtension)

Write-Host "Converting" $in "to" $newExtension ".."
inkscape $in -z --export-area-drawing --export-png=$out -w 500
