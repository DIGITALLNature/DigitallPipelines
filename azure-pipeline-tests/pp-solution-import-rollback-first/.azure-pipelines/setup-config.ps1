return @{
    AzSubscriptionId                = $ENV:AZURE_CLI_SUBSCRIPTTION_ID;
    AzAccountName                   = $ENV:AZURE_CLI_ACCOUNT_NAME;
    AzTenantId                      = $ENV:AZURE_CLI_TENANT_ID;

    DevOpsTenantId                  = $ENV:DEVOPS_TENANT_ID;
    DevOpsOrganization              = $ENV:DEVOPS_ORGANIZATION;
    DevOpsProjectName               = $ENV:DEVOPS_PROJECT_NAME;

    GitHubServiceConnections        = @(
        @{
            Name = "(TEST CI) DIGITALL Pipelines Test";
            Url  = "https://github.com/moberstein/DIGITALLPipelines"; # TODO! Change before merge
            Pat  = $ENV:GITHUB_PAT;
        }
    );

    PowerPlatformServiceConnections = @(
        @{
            Url      = $ENV:PP_CONN_TEST_URL;
            AppId    = $ENV:PP_CONN_TEST_APPID;
            TenantId = $ENV:PP_CONN_TEST_TENANTID;
            Name     = "(TEST CI) Test Solution Conn";
            Secret   = $ENV:PP_CONN_TEST_SECRET;
        }
    );

    VariableGroups                  = @(
        @{
            Name      = "(TEST CI) Test Solution Url";
            Variables = @(
                @{
                    Name   = "PowerPlatformUrl";
                    Value  = $ENV:PP_CONN_TEST_URL;
                    Secret = $false;
                }
            )
        }
    );

    Environments                    = @(
        @{
            Name = "(TEST CI) Test Solution Env";
        }
    );

    Pipelines                       = @(
        @{
            Name         = "(TEST CI) 00 Rollback first import - prepare";
            Path         = "/azure-pipeline-tests/pp-solution-import-rollback-first/.azure-pipelines/00-prepare-test-environment.yml";
            PipelinePath = "pipeline-tests/pp-solution-import-rollback-first"
        },
        @{
            Name         = "(TEST CI) 01 Rollback first import - import";
            Path         = "/azure-pipeline-tests/pp-solution-import-rollback-first/.azure-pipelines/01-import-solutions.yml";
            PipelinePath = "pipeline-tests/pp-solution-import-rollback-first"
        },
        @{
            Name         = "(TEST CI) 02 Rollback first import - check";
            Path         = "/azure-pipeline-tests/pp-solution-import-rollback-first/.azure-pipelines/02-check-solutions.yml";
            PipelinePath = "pipeline-tests/pp-solution-import-rollback-first"
        }
    );

    PipelineSource                  = @{
        RepositoryType                        = "github";
        RepositoryUrl                         = "https://github.com/moberstein/DIGITALLPipelines"; # TODO! Change before merge
        RepositoryBranch                      = "main";
        RepositoryGitHubServiceConnectionName = "(TEST CI) DIGITALL Pipelines Test";
    };
}