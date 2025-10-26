// Sample Azure Storage Account resource
param location string = resourceGroup().location
param storageAccountName string = 'mystorageacct${uniqueString(resourceGroup().id)}'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: false
    encryption: {
      services: {
        blob: {
          enabled: false
        }
        file: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
  }
}

output storageAccountId string = storageAccount.id
output storageAccountName string = storageAccount.name
