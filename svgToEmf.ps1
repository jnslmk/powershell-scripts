param (
   [Parameter(Mandatory=$true)][string]$in
)
if (!(Test-Path $in)) {
   Write-Host "Script interrupted - File" $in "does not exist"
   exit
}
   
$in = Convert-Path $in

if (!([IO.Path]::GetExtension($in) -eq ".svg")) {
   Write-Host "Script interrupted - Please provide a .svg-file"
   exit
}

# Create output filename by changing extension
$newExtension = "emf"
$out = [io.path]::ChangeExtension($in, $newExtension)

Write-Host "Converting" $in "to emf.."
inkscape $in -g --verb=FitCanvasToDrawing --verb=FileSave --verb=FileClose --verb=FileQuit
inkscape $in -z --export-dpi=400 --export-area-drawing --export-emf=$out