<#	
	===========================================================================
	 Created with: 	MS Code
	 Created on:   	29-04-2019 20:51
	 Created by:   	Daniel Lindegaard
	 Organization: 	N/A
     Filename:     	InMobile.psm1
     Version:       0.0.0.1
	-------------------------------------------------------------------------
	 Module Name: InMobile
	===========================================================================
#>
#The config file have "_Nocommit"
[System.String]$ConfigFileName = '\_NoCommit_Config_Test.json'

$ScriptLocation	= Split-Path -Path ($MyInvocation.MyCommand.Path | Get-ItemProperty | Select-Object -ExpandProperty DirectoryName)
$Config			= (ConvertFrom-Json -InputObject $(Get-Content -Path "$((Get-Item -Path $ScriptLocation).Parent)\Config\_NoCommit_Config_Test.json" -Raw -Encoding UTF8))
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
