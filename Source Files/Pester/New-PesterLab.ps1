function New-PesterLab ($Path,$Name) {
    New-Item -Path $Path -Name $Name -ItemType Directory -Force
    New-Item -Path "$Path\$Name" -Name "$Name.config" -ItemType File -Force
    Set-Content -Path "$Path\$Name.config" -Value 'Pester is Pretty Awesome' -Force
}

$Path = 'E:\Documents\Local Github Repos\InMobile\Source Files\Pester'
$Name = 'PesterTesting'


New-PesterLab -Path "E:\Documents\Local Github Repos\InMobile\Source Files\Pester" -Name "PesterTesting"