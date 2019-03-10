<#
	.SYNOPSIS
		A brief description of the New-ConfigFile function.

	.DESCRIPTION
		A detailed description of the New-ConfigFile function.

	.PARAMETER  ParameterA
		The description of a the ParameterA parameter.

	.PARAMETER  ParameterB
		The description of a the ParameterB parameter.

	.EXAMPLE
		PS C:\> New-ConfigFile -ParameterA 'One value' -ParameterB 32
		'This is the output'
		This example shows how to call the New-ConfigFile function with named parameters.

	.EXAMPLE
		PS C:\> New-ConfigFile 'One value' 32
		'This is the output'
		This example shows how to call the New-ConfigFile function with positional parameters.

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
function New-ConfigFile66 {
	[CmdletBinding()]
	param(
		[Parameter(Position=0, Mandatory=$false)]
		[System.Boolean]
		$Test = $True,
		[Parameter(Position=1, Mandatory = $True)]
		[System.String]
		$Path
	)
	begin {
		try
		{
			#region HashTables Chunks.
			<#
			In this region there are diffrent Regions of the Config file. It's been
			created in HashTables, and then assembelt in main Hash that will be outputet.
			#>
			[hashtable]$TestGroups_Locations = @{
				Header		   		= "TestGroups_Locations";
				Locations_GroupName = "DataStuff";
			}
			[hashtable]$ProdGroups_Locations = @{
				Header		   		= "ProdGroups_Locations";
				Locations_GroupName = "Locations_Prod"; }
			
			[hashtable]$Locations_RoomNr = @{
				Header		   = "Room Numbers";
				Locations_Test = "Datastuff"; }
			
			#endregion
			
			#region Main HashTables constructs.
						
			[hashtable]$exampleConfig = @{
				Header0   = "Datastuff";
				Locations = $Locations;
			}
			
			#endregion
			
		}
		catch
		{
			
		}
	}
	process {
		try {
			$TestGroups_Locations | ConvertTo-Json
		}
		catch {
		}
	}
	end {
		try {
		}
		catch {
		}
	}
}