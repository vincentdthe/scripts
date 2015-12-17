﻿<#
.Synopsis
    Shows the permissions of a certificate's private key file.

.Parameter Certificate
    The certificate to display permissions for.

.Link
    Find-Certificate.ps1

.Example
    Show-CertificatePermissions.ps1 -Certificate $cert
    Displays the permissions for the certificate in $cert.

.Example
    Find-Certificate.ps1 -FindValue ExampleCert -FindType FindBySubjectName -StoreName TrustedPeople -StoreLocation LocalMachine |Show-CertificatePermissions
    Displays the permissions for the certificate.

.Example
    $c = Find-Certificate.ps1 ExampleCert FindBySubjectName TrustedPeople LocalMachine ; Show-CertificatePermissions.ps1 $c
    Another approach to display cert permissions.
#>

[CmdletBinding()] Param(
[Parameter(Position=0,Mandatory=$true,ValueFromPipeline=$true)]
[System.Security.Cryptography.X509Certificates.X509Certificate2]$Certificate
)
Begin{try{Get-Command icacls -CommandType Application |Out-Null}catch{throw 'The icacls command is missing.'}}
Process
{
    icacls (Get-CertificatePath.ps1 $Certificate)
}