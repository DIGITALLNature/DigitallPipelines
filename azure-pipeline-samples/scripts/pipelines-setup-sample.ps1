# Example PipelineConfig object for pipeline-setup.ps1

$PipelineConfig = @{
    DevOpsPAT           = '8R1MZpxemRjt2GuAjzd7fPCbBABMuK8gRYkdMWFP8u0GNRAx58W7JQQJ99BGACAAAAAFrwcfAAASAZDOriGX'
    DevOpsOrganization  = 'https://dev.azure.com/digitallnature'
    DevOpsProjectName   = 'ProjectName'
    GitHubServiceConnections        = @(
        @{
            Name                  = "DIGITALL Pipelines Service Connection"
            Url                   = "https://github.com/DIGITALLNature/DigitallPipelines.git"
            Pat                   = "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"
        }
    )
    PowerPlatformServiceConnections = @(
        @{
            Name         = "Power Platform Service Connection Development"
            Url          = "https://digitallnaturedev.crm.dynamics.com"
            AppId        = "<client-id>"
            Secret       = "<client-secret>"
            TenantId     = "901d0ccc-2f11-46e6-9665-cafe033304fb"
        },
        @{
            Name     = "Power Platform Service Connection Test"
            Url      = "https://digitallnaturetest.crm.dynamics.com"
            AppId    = "<client-id>"
            Secret   = "<client-secret>"
            TenantId = "901d0ccc-2f11-46e6-9665-cafe033304fb"
        },
        @{
            Name     = "Power Platform Service Connection Production"
            Url      = "https://digitallnatureprod.crm.dynamics.com"
            AppId    = "<client-id>"
            Secret   = "<client-secret>"
            TenantId = "901d0ccc-2f11-46e6-9665-cafe033304fb"
        }
    )
    VariableGroups                  = @(
        @{
            Name      = "Power Platform Environment Development"
            Variables = @(
                @{
                    Name   = "PowerPlatformEnvironmentFriendlyName"
                    Value  = "Development"
                    Secret = $false
                }
                @{
                    Name   = "PowerPlatformUrl"
                    Value  = "https://digitallnaturedev.crm.dynamics.com"
                    Secret = $false
                }
            )
        },
        @{
            Name      = "Power Platform Environment Test"
            Variables = @(
                @{
                    Name   = "PowerPlatformEnvironmentFriendlyName"
                    Value  = "Test"
                    Secret = $false
                }
                @{
                    Name   = "PowerPlatformUrl"
                    Value  = "https://digitallnaturetest.crm.dynamics.com"
                    Secret = $false
                }
            )
        },
        @{
            Name      = "Power Platform Environment Production"
            Variables = @(
                @{
                    Name   = "PowerPlatformEnvironmentFriendlyName"
                    Value  = "Production"
                    Secret = $false
                }
                @{
                    Name   = "PowerPlatformUrl"
                    Value  = "https://digitallnatureprod.crm.dynamics.com"
                    Secret = $false
                }
            )
        }
    )
    Environments = @(
        @{ Name = "Power Platform Environment Production" }
        @{ Name = "Power Platform Environment Test"}
    )
    Pipelines                       = @(
        @{
            Name         = "Upgrade solution concept"
            PipelinePath = "\\Maintenance"
            Path         = ".azure-pipelines/dgt-solution-concept/upgrade-solution-concept.yml"
        },
        @{
            Name         = "Update solution configuration"
            PipelinePath = "\\Maintenance"
            Path         = ".azure-pipelines/solutions/update-solution-configuration.yml"
        },
        @{
            Name         = "Export solutions"
            PipelinePath = "\\CI-CD"
            Path         = ".azure-pipelines/solutions/export-solution.yml"
        },
        @{
            Name         = "Deploy solutions"
            PipelinePath = "\\CI-CD"
            Path         = ".azure-pipelines/solutions/deploy-solution.yml"
        }
    )

    PipelineSource                  = @{
        RepositoryType                        = "tfsgit"
        RepositoryUrl                         = "https://dev.azure.com/digitallnature/ProjectName/_git/ProjectName"
        RepositoryBranch                      = "main"
    }
}

. $PSScriptRoot/../../azure-pipeline-scripts/pipeline-setup.ps1 -PipelineConfig $PipelineConfig