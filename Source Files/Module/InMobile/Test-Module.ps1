<#	
	.NOTES 
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.156
	 Created on:   	18-01-2019 11:07
	 Created by:   	Daniel Lindegaard
	 Organization: 	
	 Filename:     	Test-Module.ps1
	===========================================================================
	.DESCRIPTION
	The Test-Module.ps1 script lets you test the functions and other features of
	your module in your PowerShell Studio module project. It's part of your project,
	but it is not included in your module.

	In this test script, import the module (be careful to import the correct version)
	and write commands that test the module features. You can include Pester
	tests, too.

	To run the script, click Run or Run in Console. Or, when working on any file
	in the project, click Home\Run or Home\Run in Console, or in the Project pane, 
	right-click the project name, and then click Run Project.
#>

$ScriptLocation	= Split-Path -Path ($MyInvocation.MyCommand.Path | Get-ItemProperty | Select-Object -ExpandProperty DirectoryName)
$Config			= (ConvertFrom-Json -InputObject $(Get-Content -Path "$((Get-Item -Path $ScriptLocation).Parent)\Config\_NoComit_Config_Test.json" -Raw -Encoding UTF8))
$API			= $Config.System_Information.InMobile_API

#Explicitly import the module for testing
Import-Module 'InMobile'

#Run each module function
Get-GroupData -API $API | Out-File -PSPath "$ScriptLocation\XMLDataFromInMobile.xml"
[XML]$FromInMobile = Get-Content "$ScriptLocation\XMLDataFromInMobile.xml"

$FromInMobile.ApiResult.Data.Group.Id

foreach ($Group in ($FromInMobile.ApiResult.Data.Group)) {
	$GroupsObj = @{
		GroupeName = $Group.Name;
		GroupeID = $Group.Id
	}
	$object = new-object psobject -Property $GroupsObj
	$object
}

#Sample Pester Test
#Describe "Test InMobile" {
#	It "tests Write-HellowWorld" {
#		Write-HelloWorld | Should BeExactly "Hello World"
#	}	
#}