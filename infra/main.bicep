targetScope = 'subscription'

@minLength(1)
@maxLength(64)
@description('Name which is used to generate a short unique hash for each resource')
param name string

@minLength(1)
@description('Primary location for all resources')
param location string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${name}_group'
  location: location
}

module resources 'resources.bicep' = {
  name: 'resources'
  scope: resourceGroup
  params: {
    location: location
  }
}

output APPLICATIONINSIGHTS_CONNECTION_STRING string = resources.outputs.APPLICATIONINSIGHTS_CONNECTION_STRING
output GROUP_NAME string = resourceGroup.name
output GROUP_URL string = format('https://portal.azure.com/#@/resource{0}', resourceGroup.id) 
output ACR_NAME string = resources.outputs.ACR_NAME
output MI_ID string = resources.outputs.MI_ID
output MI_CLIENT_ID string = resources.outputs.MI_CLIENT_ID
