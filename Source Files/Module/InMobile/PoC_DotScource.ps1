<#	
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.156
	 Created on:   	18-01-2019 11:07
	 Created by:   	Daniel Lindegaard
	 Organization: 	
	 Filename:     	InMobile.psm1
	-------------------------------------------------------------------------
	 Module Name:	InMobile
	===========================================================================
#>

$here = Split-Path -Parent $MyInvocation.MyCommand.Path

$Functions = Get-ChildItem -Path "$here\functions\*.ps1" -Recurse -Exclude "*Pester*,*.test.ps1*"
