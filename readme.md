# Backup Script for Files to C Drive

## Description
This PowerShell script automates the backup process for specified folders to the C drive. It compresses the folders into a ZIP file with today's date appended to the filename. The script also maintains a log of the backup process. Additionally, it checks for the number of backup ZIP files in the designated backup folder and deletes the oldest files if the count exceeds seven.

## Prerequisites
- Windows operating system
- PowerShell

## Usage in normal
1. Modify the `$folders` array to include the paths of the folders you want to backup.
2. Set the `$backupFolder` variable to specify the destination folder for the backup ZIP files.
3. Run the script.

## Usage with Task Scheduler
1. Modify the `$folders` array to include the paths of the folders you want to backup.
2. Set the `$backupFolder` variable to specify the destination folder for the backup ZIP files.
3. Open task scheduler on Windows
4. Create a Basic Task
5. [How to create an automated task using Task Scheduler by Windows Central](https://www.windowscentral.com/how-create-automated-task-using-task-scheduler-windows-10)

## Notes
- Ensure that the PowerShell script execution policy allows script execution. You can set it to RemoteSigned or Unrestricted for this script to run properly.
- This script assumes that the `Compress-Archive` cmdlet is available, which requires PowerShell version 5.0 or later.
- Make sure that the user running the script has the necessary permissions to read from the source folders and write to the backup destination folder.

## License
This script is released under the [MIT License](LICENSE).
