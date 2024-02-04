# PowerShell Script to Create Symbolic Link for .ideavimrc after Deleting Existing File

# Get the current user's home directory
$homeDir = [System.Environment]::GetFolderPath('UserProfile')

# Define the source and target paths
$sourcePath = ".\.ideavimrc"
$targetPath = "$homeDir\.ideavimrc"

# Check if the target file exists and delete it
if (Test-Path -Path $targetPath) {
    Remove-Item -Path $targetPath -Force
    Write-Host "Existing .ideavimrc file in the profile directory has been deleted."
}

# Check if the source file exists
if (Test-Path -Path $sourcePath) {
    # Create the symbolic link
    New-Item -ItemType SymbolicLink -Path $targetPath -Target $sourcePath
    Write-Host "Symbolic link created successfully."
} else {
    Write-Host "Source file not found in the current directory."
}
