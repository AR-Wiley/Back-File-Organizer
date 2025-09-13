# Check to validate that Backup Folder exists

$backup_folder = "C:\Users\wiley\Desktop\Backup"

if (!(Test-Path -Path $backup_folder)){
    New-Item -Path $backup_folder -ItemType Directory
}

#Define Array with folder destination paths

$destination_path = @(
    "C:\Users\wiley\Desktop\Backup\Text_Files",
    "C:\Users\wiley\Desktop\Backup\Batch_Files",
    "C:\Users\wiley\Desktop\Backup\PowerShell_Files",
    "C:\Users\wiley\Desktop\Backup\Null"
)

# Validate that destination path exists. If path does not exist, creat folder

foreach ($path in $destination_path){
    if (!(Test-Path -Path $path)){
        New-Item -Path $path -ItemType Directory
    }    
}

#Define Variables 

$text_files = "C:\Users\wiley\Desktop\Backup\Text_Files"
$batch_files = "C:\Users\wiley\Desktop\Backup\Batch_Files"
$powershell_files = "C:\Users\wiley\Desktop\Backup\PowerShell_Files"
$null = "C:\Users\wiley\Desktop\Backup\Null"

$folder_path = "C:\Users\wiley\Desktop\GlobexFiles"

#Loop through path variable and sort

foreach ($file in Get-ChildItem -Path $folder_path -File){
    if($file.Extension -eq ".txt" ) {
        Copy-Item -Path $file.FullName -Destination $text_files
    } elseif($file.Extension -eq ".ps1"){
        Copy-Item -Path $file.FullName -Destination $powershell_files    
    } elseif($file.Extension -eq ".bat") {
        Copy-Item -Path $file.FullName -Destination $batch_files 
    } else {
        Copy-Item -Path $file.FullName -Destination $null
    }
}
 

