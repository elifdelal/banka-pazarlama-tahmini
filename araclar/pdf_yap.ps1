# Word ile .docx -> .pdf dönüştürür:  powershell -File araclar/pdf_yap.ps1 <docx> <pdf>
param([string]$Girdi, [string]$Cikti)
$w = New-Object -ComObject Word.Application
$w.Visible = $false
try {
  $d = $w.Documents.Open((Resolve-Path $Girdi).Path, $false, $true)
  $d.Fields.Update() | Out-Null
  $d.ExportAsFixedFormat($Cikti, 17)
  "Sayfa sayisi: " + $d.ComputeStatistics(2)
  $d.Close($false)
} finally { $w.Quit() }
