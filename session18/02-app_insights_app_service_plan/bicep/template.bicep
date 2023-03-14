@description('App service plan name')
param appServiceName string

@description('Resource group Of app service plan')
param resourceGroupName string

var appServiceId = resourceId(resourceGroupName, 'Microsoft.Web/serverfarms', appServiceName)

resource appServicePlan 'Microsoft.Portal/dashboards@2020-09-01-preview' = {
  name: 'appServicePlan'
  location: resourceGroup().location
  properties: {
    lenses: [
      {
        order: 0
        parts: [
          {
            position: {
              x: 0
              y: 0
              colSpan: 6
              rowSpan: 4
            }
            metadata: {
              inputs: [
                {
                  name: 'options'
                  isOptional: true
                }
                {
                  name: 'sharedTimeRange'
                  isOptional: true
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                  options: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: appServiceId
                          }
                          name: 'CpuPercentage'
                          aggregationType: 4
                          namespace: 'microsoft.web/serverfarms'
                          metricVisualization: {
                            displayName: 'CPU Percentage'
                            resourceDisplayName: 'sfp246'
                          }
                        }
                        {
                          resourceMetadata: {
                            id: appServiceId
                          }
                          name: 'CpuPercentage'
                          aggregationType: 3
                          namespace: 'microsoft.web/serverfarms'
                          metricVisualization: {
                            displayName: 'CPU Percentage'
                            resourceDisplayName: 'sfp246'
                          }
                        }
                      ]
                      title: 'Avg CPU Percentage and Max CPU Percentage for sfp246'
                      titleKind: 1
                      visualization: {
                        chartType: 2
                        legendVisualization: {
                          isVisible: true
                          position: 2
                          hideSubtitle: false
                        }
                        axisVisualization: {
                          x: {
                            isVisible: true
                            axisType: 2
                          }
                          y: {
                            isVisible: true
                            axisType: 1
                          }
                        }
                        disablePinning: true
                      }
                    }
                  }
                }
              }
            }
          }
          {
            position: {
              x: 6
              y: 0
              colSpan: 6
              rowSpan: 4
            }
            metadata: {
              inputs: [
                {
                  name: 'options'
                  isOptional: true
                }
                {
                  name: 'sharedTimeRange'
                  isOptional: true
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                  options: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: appServiceId
                          }
                          name: 'MemoryPercentage'
                          aggregationType: 4
                          namespace: 'microsoft.web/serverfarms'
                          metricVisualization: {
                            displayName: 'Memory Percentage'
                            resourceDisplayName: 'sfp246'
                          }
                        }
                        {
                          resourceMetadata: {
                            id: appServiceId
                          }
                          name: 'MemoryPercentage'
                          aggregationType: 3
                          namespace: 'microsoft.web/serverfarms'
                          metricVisualization: {
                            displayName: 'Memory Percentage'
                            resourceDisplayName: 'sfp246'
                          }
                        }
                      ]
                      title: 'Avg Memory Percentage and Max Memory Percentage for sfp246'
                      titleKind: 1
                      visualization: {
                        chartType: 2
                        legendVisualization: {
                          isVisible: true
                          position: 2
                          hideSubtitle: false
                        }
                        axisVisualization: {
                          x: {
                            isVisible: true
                            axisType: 2
                          }
                          y: {
                            isVisible: true
                            axisType: 1
                          }
                        }
                        disablePinning: true
                      }
                    }
                  }
                }
              }
            }
          }
          {
            position: {
              x: 0
              y: 4
              colSpan: 6
              rowSpan: 4
            }
            metadata: {
              inputs: [
                {
                  name: 'options'
                  isOptional: true
                }
                {
                  name: 'sharedTimeRange'
                  isOptional: true
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                  options: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: appServiceId
                          }
                          name: 'DiskQueueLength'
                          aggregationType: 4
                          namespace: 'microsoft.web/serverfarms'
                          metricVisualization: {
                            displayName: 'Disk Queue Length'
                            resourceDisplayName: 'sfp246'
                          }
                        }
                        {
                          resourceMetadata: {
                            id: appServiceId
                          }
                          name: 'DiskQueueLength'
                          aggregationType: 3
                          namespace: 'microsoft.web/serverfarms'
                          metricVisualization: {
                            displayName: 'Disk Queue Length'
                            resourceDisplayName: 'sfp246'
                          }
                        }
                      ]
                      title: 'Avg Disk Queue Length and Max Disk Queue Length for sfp246'
                      titleKind: 1
                      visualization: {
                        chartType: 2
                        legendVisualization: {
                          isVisible: true
                          position: 2
                          hideSubtitle: false
                        }
                        axisVisualization: {
                          x: {
                            isVisible: true
                            axisType: 2
                          }
                          y: {
                            isVisible: true
                            axisType: 1
                          }
                        }
                        disablePinning: true
                      }
                    }
                  }
                }
              }
            }
          }
          {
            position: {
              x: 6
              y: 4
              colSpan: 6
              rowSpan: 4
            }
            metadata: {
              inputs: [
                {
                  name: 'options'
                  isOptional: true
                }
                {
                  name: 'sharedTimeRange'
                  isOptional: true
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                  options: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            id: appServiceId
                          }
                          name: 'HttpQueueLength'
                          aggregationType: 4
                          namespace: 'microsoft.web/serverfarms'
                          metricVisualization: {
                            displayName: 'Http Queue Length'
                            resourceDisplayName: 'sfp246'
                          }
                        }
                        {
                          resourceMetadata: {
                            id: appServiceId
                          }
                          name: 'HttpQueueLength'
                          aggregationType: 3
                          namespace: 'microsoft.web/serverfarms'
                          metricVisualization: {
                            displayName: 'Http Queue Length'
                            resourceDisplayName: 'sfp246'
                          }
                        }
                      ]
                      title: 'Avg Http Queue Length and Max Http Queue Length for sfp246'
                      titleKind: 1
                      visualization: {
                        chartType: 2
                        legendVisualization: {
                          isVisible: true
                          position: 2
                          hideSubtitle: false
                        }
                        axisVisualization: {
                          x: {
                            isVisible: true
                            axisType: 2
                          }
                          y: {
                            isVisible: true
                            axisType: 1
                          }
                        }
                        disablePinning: true
                      }
                    }
                  }
                }
              }
            }
          }
        ]
      }
    ]
    metadata: {
      model: {
        timeRange: {
          value: {
            relative: {
              duration: 24
              timeUnit: 1
            }
          }
          type: 'MsPortalFx.Composition.Configuration.ValueTypes.TimeRange'
        }
        filterLocale: {
          value: 'en-us'
        }
        filters: {
          value: {
            MsPortalFx_TimeRange: {
              model: {
                format: 'utc'
                granularity: 'auto'
                relative: '24h'
              }
              displayCache: {
                name: 'UTC Time'
                value: 'Past 24 hours'
              }
              filteredPartIds: [
                'StartboardPart-MonitorChartPart-19c2edf3-3c59-47c4-931e-dd1cde7b8427'
                'StartboardPart-MonitorChartPart-19c2edf3-3c59-47c4-931e-dd1cde7b84e8'
                'StartboardPart-MonitorChartPart-19c2edf3-3c59-47c4-931e-dd1cde7b84f4'
                'StartboardPart-MonitorChartPart-19c2edf3-3c59-47c4-931e-dd1cde7b8500'
              ]
            }
          }
        }
      }
    }
  }
}