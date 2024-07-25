# Copyright (c) DIGITALL Nature. All rights reserved
# DIGITALL Nature licenses this file to you under the Microsoft Public License.

param (
    [Parameter(Mandatory = $true)]
    [string]$Organization,

    [Parameter(Mandatory = $true)]
    [string]$Project,

    [Parameter(Mandatory = $true)]
    [string]$PipelineName
)

Write-Debug "- Loading existing pipelines"
$existingPipelinesJson = az pipelines list `
    --organization $Organization `
    --project "$ProjectName" `
    --output json

if ($LASTEXITCODE -ne 0) {
    throw "Error loading existing pipelines"
}

$existingPipelines = $existingPipelinesJson | ConvertFrom-Json

$pipeline = $existingPipelines | Where-Object { $_.name -eq $PipelineName }

if ($null -eq $pipeline) {
    Write-Error "Pipeline '$PipelineName' not found."
    return
}

Write-Host "Queuing pipeline '$PipelineName'"
az pipelines run --id $pipeline.id --org $Organization --project $Project
