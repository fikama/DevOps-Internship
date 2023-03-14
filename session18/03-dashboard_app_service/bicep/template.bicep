@description('Region of Dashboard')
param dashboardLocation string

@description('App service plan name')
param appServiceName string

@description('Resource group Of app service plan')
param appServiceGroupName string

var appServiceId = resourceId(appServiceGroupName, 'Microsoft.Web/sites', appServiceName)

resource appService 'Microsoft.Portal/dashboards@2020-09-01-preview' = {
  name: 'appService'
  location: dashboardLocation
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
                          name: 'IoReadOperationsPerSecond'
                          aggregationType: 1
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'IO Read Operations Per Second'
                            resourceDisplayName: 'testappsite24664285'
                          }
                        }
                        {
                          resourceMetadata: {
                            id: appServiceId
                          }
                          name: 'HttpResponseTime'
                          aggregationType: 4
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'Response Time'
                            resourceDisplayName: 'testappsite24664285'
                          }
                        }
                        {
                          resourceMetadata: {
                            id: appServiceId
                          }
                          name: 'HttpResponseTime'
                          aggregationType: 3
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'Response Time'
                            resourceDisplayName: 'testappsite24664285'
                          }
                        }
                        {
                          resourceMetadata: {
                            id: appServiceId
                          }
                          name: 'RequestsInApplicationQueue'
                          aggregationType: 4
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'Requests In Application Queue'
                            resourceDisplayName: 'testappsite24664285'
                          }
                        }
                        {
                          resourceMetadata: {
                            id: appServiceId
                          }
                          name: 'RequestsInApplicationQueue'
                          aggregationType: 3
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'Requests In Application Queue'
                            resourceDisplayName: 'testappsite24664285'
                          }
                        }
                      ]
                      title: 'Sum IO Read Operations Per Second, Avg Response Time, and 3 other metrics for testappsite24664285'
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
                          name: 'CpuTime'
                          aggregationType: 1
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'CPU Time'
                            resourceDisplayName: 'testappsite24664285'
                          }
                        }
                      ]
                      title: 'Sum CPU Time for testappsite24664285'
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
                          name: 'MemoryWorkingSet'
                          aggregationType: 4
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'Memory working set'
                            resourceDisplayName: 'testappsite24664285'
                          }
                        }
                        {
                          resourceMetadata: {
                            id: appServiceId
                          }
                          name: 'MemoryWorkingSet'
                          aggregationType: 3
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'Memory working set'
                            resourceDisplayName: 'testappsite24664285'
                          }
                        }
                      ]
                      title: 'Avg Memory working set and Max Memory working set for testappsite24664285'
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
                          name: 'Http101'
                          aggregationType: 1
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'Http 101'
                            resourceDisplayName: 'testappsite24664285'
                          }
                        }
                        {
                          resourceMetadata: {
                            id: appServiceId
                          }
                          name: 'Http2xx'
                          aggregationType: 1
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'Http 2xx'
                            resourceDisplayName: 'testappsite24664285'
                          }
                        }
                        {
                          resourceMetadata: {
                            id: appServiceId
                          }
                          name: 'Http3xx'
                          aggregationType: 1
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'Http 3xx'
                            resourceDisplayName: 'testappsite24664285'
                          }
                        }
                        {
                          resourceMetadata: {
                            id: appServiceId
                          }
                          name: 'Http4xx'
                          aggregationType: 1
                          namespace: 'microsoft.web/sites'
                          metricVisualization: {
                            displayName: 'Http 4xx'
                            resourceDisplayName: 'testappsite24664285'
                          }
                        }
                      ]
                      title: 'Sum Http 101, Sum Http 2xx, and 2 other metrics for testappsite24664285'
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
                'StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c777184'
                'StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c777196'
                'StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c7771a2'
                'StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c7771ae'
              ]
            }
          }
        }
      }
    }
  }
}