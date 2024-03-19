<#
Backup Files to C drive 
#>

# Folder locations
$folders = @(
    "D:\Test\",
	"C:\Users\Test\Downloads\"
)

# Destination folder for backup
$backupFolder = "C:\Backup"

# Construct the final ZIP file path with today's date
$zipFileName = "Backup_$(Get-Date -Format 'yyyyMMdd').zip"
$zipFilePath = Join-Path $backupFolder $zipFileName

# Log file path inside the ZIP archive
$logFilePath = "C:\Backup\backup_$(Get-Date -Format 'yyyyMMdd').log"
New-Item $logFilePath
Start-Transcript -Path $logFilePath -Append

# Loop through each folder and add to the temporary ZIP archive
foreach ($folder in $folders) {
    Compress-Archive -Path $folder -Update -DestinationPath $ZipFilePath -Verbose
}

# List all ZIP files in the folder
$zipFiles = Get-ChildItem -Path $backupFolder -Filter "*.zip" -File | Sort-Object CreationTime 
$zipFiles

# Check if the number of ZIP files exceeds 7
if ($zipFiles.Count -gt 7) {
    # Calculate the number of files to delete
    $filesToDeleteCount = $zipFiles.Count - 7
    
    # Delete the oldest file(s)
    $filesToDelete = $zipFiles[0..($filesToDeleteCount - 1)]
    foreach ($file in $filesToDelete) {
        Write-Host "Deleting $($file.FullName)" -Verbose
        Remove-Item -Path $file.FullName -Force -Verbose
    }
} else {
    Write-Host "No ZIP files found or number of ZIP files is 7 or fewer." -Verbose
}

Stop-Transcript
