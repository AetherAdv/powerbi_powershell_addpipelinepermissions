Connect-PowerBIServiceAccount


# Get list of pipelines (optional)
$apiUrlPipelines = "admin/pipelines"
$pipelineList = Invoke-PowerBIRestMethod -Url $apiUrlPipelines -Method Get

#---------------------------------

$pipelineId = "####"
$userEmail = "user@example.com"

# Get users assigned to a pipeline
$apiUrlUsers = "admin/pipelines/$pipelineId/users"
$pipelineUsers = Invoke-PowerBIRestMethod -Url $apiUrlUsers -Method Get
$pipelineUsers | ConvertTo-Json -Depth 2


# Add a user as Admin
$body = @{
    identifier = $userEmail
    accessRight = "Admin"
    principalType = "User"
} | ConvertTo-Json -Depth 3

Invoke-PowerBIRestMethod -Url $apiUrlUsers -Method Post -Body $body -ContentType "application/json"
