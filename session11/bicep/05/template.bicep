param appServiceName string
param storageAccountURL string
param frequencyInterval int

@allowed([
  'Day'
  'Hour'
])
param frequencyUnit string
param retentionPeriodInDays int

resource appServiceName_backup 'Microsoft.Web/sites/config@2022-03-01' = {
  name: '${appServiceName}/backup'
  kind: 'backup'
  properties: {
    backupName: 'nameOfTheBackup'
    backupSchedule: {
      frequencyInterval: frequencyInterval
      frequencyUnit: frequencyUnit
      keepAtLeastOneBackup: 'true'
      retentionPeriodInDays: retentionPeriodInDays
    }
    enabled: 'true'
    storageAccountUrl: storageAccountURL
  }
}