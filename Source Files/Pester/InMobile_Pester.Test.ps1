
$ScriptLocation	= Split-Path -Path ($MyInvocation.MyCommand.Path | Get-ItemProperty | Select-Object -ExpandProperty DirectoryName)
$Config			= (ConvertFrom-Json -InputObject $(Get-Content -Path "$((Get-Item -Path $ScriptLocation))\Config\_NoComit_Config_Test.json" -Raw -Encoding UTF8))
$API			= $Config.System_Information.InMobile_API

<#
Describe "Get-AllGroups Test" {

    $result = Get-AllGroups -api $API

    it 'should invoke Invoke-WebRequest'{

        mock 'Invoke-WebRequest' {
            'invoke-webrequest mocked'
        }
   
        it 'should return mocked string' {
            $result.ApiResult.Data.Group.ID | should be '2wc46ad8-6c9e-42fa-btdc-cfa624b30773'
        }
        
        it 'should be mocked' {
            $assMParams = @{
                CommandName = 'Invoke-WebRequest'
                Times = 1
                Exactly = $true
            }
            Assert-MockCalled $assMParams
        }           
    }
}
#>

Describe "Get-AllGroups Test1" {

    $result = Get-AllGroups -api $API

    it 'should invoke Invoke-WebRequest'{
        it 'should return mocked string' {
            $result.ApiResult.Data.Group.ID | should -Not -BeNullOrEmpty
        }
    }
}
