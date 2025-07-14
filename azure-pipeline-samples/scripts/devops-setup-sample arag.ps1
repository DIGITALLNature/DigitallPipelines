$DevOpsConfig = @{
    AzTenantId         = '8ffb3be7-83a7-463f-a543-aedb2683b1ae'
    DevOpsOrganization = 'https://dev.azure.com/de-ARAG-D365CI'
    DevOpsProjectName  = 'P5001667 (D365 Customer Insights Journey Deploy Pipeline)'
    DevOpsPAT          = '8R1MZpxemRjt2GuAjzd7fPCbBABMuK8gRYkdMWFP8u0GNRAx58W7JQQJ99BGACAAAAAFrwcfAAASAZDOriGX'
    # Change the list of repositories to match your project setup, by default https://digitallnature.github.io/devops.html#repositories applies
    Repositories       = @(
        @{
            Name     = 'Serverside'
            Template = 'https://digitallnature@dev.azure.com/digitallnature/Template%20Project/_git/Serverside-Template'
        },
        @{
            Name     = 'Clientside'
            Template = 'https://digitallnature@dev.azure.com/digitallnature/Template%20Project/_git/Clientside-Template'
        },
        @{
            Name     = 'Documentation'
            Template = 'https://digitallnature@dev.azure.com/digitallnature/Template%20Project/_git/Documentation-Template'
        },
        @{
            Name     = 'Documentation'
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

