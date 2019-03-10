
$here = Split-Path -Parent $MyInvocation.MyCommand.Path

<#
	.SYNOPSIS
		A brief description of the Get-GroupData function.

	.DESCRIPTION
		A detailed description of the Get-GroupData function.

	.PARAMETER  ParameterA
		The description of a the ParameterA parameter.

	.PARAMETER  ParameterB
		The description of a the ParameterB parameter.

	.EXAMPLE
		PS C:\> Get-GroupData -ParameterA 'One value' -ParameterB 32
		'This is the output'
		This example shows how to call the Get-GroupData function with named parameters.

	.EXAMPLE
		PS C:\> Get-GroupData 'One value' 32
		'This is the output'
		This example shows how to call the Get-GroupData function with positional parameters.

	.INPUTS
		System.String,System.Int32

	.OUTPUTS
		System.String

	.NOTES
		For more information about advanced functions, call Get-Help with any
		of the topics in the links listed below.

	.LINK
		about_functions_advanced

	.LINK
		about_comment_based_help

	.LINK
		about_functions_advanced_parameters

	.LINK
		about_functions_advanced_methods
#>
function Get-AllGroups {
	[CmdletBinding()]
	param(
		[Parameter(Position=0, Mandatory=$true)]
		[System.String]
		$API
	)
	begin {
		try
		{
			$DataSet000 = Invoke-WebRequest -Body $MultipartContent -Method 'POST' -Uri "https://mm.inmobile.dk/Api/V3/Groups/GetAll?apiKey=$($API.trim())"
			[XML]$DataSet001 = $DataSet000

			if ($DataSet001.ApiResult.Exception.Type -eq "InvalidApiKeyException") {
				throw "Something is wrong with the API. InMobiles error message was: $($DataSet001.ApiResult.Exception.Message)"
			}
		}
		#Not optimal I know, but it works for now.
		catch {
			Write-Error -Message $error[0]
		}
	}
	process {
		try {
			for ($i = 0; $i -lt $DataSet001.ApiResult.Data.Group.Count; $i++) {
				$AllGroupsObject = [PSCustomObject]@{
					ID = $DataSet001.ApiResult.Data.Group[$i].ID
					Name = $DataSet001.ApiResult.Data.Group[$i].Name
				}
				$AllGroupsObject
			}			
		}
		catch {
			Write-Error -Message "An error in creating the Object from the XML data recived from InMobile."
		}
	}
	end {
		try {
		}
		catch {
		}
	}
}
