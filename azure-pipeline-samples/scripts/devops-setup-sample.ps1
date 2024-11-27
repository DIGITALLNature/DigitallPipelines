$DevOpsConfig = @{
    AzTenantId          = '901d0ccc-2f11-46e6-9665-cafe033304fb'
    DevOpsOrganization  = 'https://dev.azure.com/digitallnature'
    DevOpsProjectName   = 'TEST'
    # Change the list of repositories to match your project setup, by default https://digitallnature.github.io/devops.html#repositories applies
    Repositories = @(
        @{
            Name = 'Serverside'
            Template = 'https://digitallnature@dev.azure.com/digitallnature/Template%20Project/_git/Serverside-Template'
        },
        @{
            Name = 'Clientside'
            Template = 'https://digitallnature@dev.azure.com/digitallnature/Template%20Project/_git/Clientside-Template'
        },
        @{
            Name = 'Documentation'
            Template = 'https://digitallnature@dev.azure.com/digitallnature/Template%20Project/_git/Documentation-Template'
        },
        @{
            Name = 'Data'
        },
        @{
            Name = 'Cloud'
        }
    );
}

. $PSScriptRoot/../../azure-pipeline-scripts/devops-setup.ps1 $DevOpsConfig