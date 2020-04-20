# PowerShell
Various PowerShell scripts I've created to make my life easier. Feel free to copy or use as a learning tool

# Contents
## Scripts
#### Start-WorkSession:
  Simple script for modifying the most recently downloaded RDP file to only show on one monitor. Good example of getting multiple files of one type, getting the newest file, and simple text replacement.

## Modules
#### Out-Message:
  Simplified method of outputting information to the console and log including optional appending, timestamps, and log only output. Good example of creating a simple module with if/else statements and using string, switch, and default parameters.
  
#### Restart-Elevated:
  Method of self elevating scripts by testing if the script is already elevated and prompted for credentials if it's not. This module also allows for parameters in the script to be passed back into the elevated script. Good example of the '-f' operator and using $PSBoundParameters.GetEnumerator() 
