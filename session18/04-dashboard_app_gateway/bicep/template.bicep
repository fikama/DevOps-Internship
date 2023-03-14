@description('Region of dashboard')
param dashboardLocation string = resourceGroup().location

@description('App Gateway name')
param appGatewayName string

@description('Resource Group of App Gateway')
param appGatewayGroupName string

var appGatewayId = resourceId(appGatewayGroupName, 'Microsoft.Network/applicationGateways', appGatewayName)

resource appGatewayDashboard 'Microsoft.Portal/dashboards@2020-09-01-preview' = {
  name: 'appGatewayDashboard'
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
                            id: appGatewayId
                          }
                          name: 'TotalRequests'
                          aggregationType: 1
                          namespace: 'microsoft.network/applicationgateways'
                          metricVisualization: {
                            displayName: 'Total Requests'
                            resourceDisplayName: 'appgateway246'
                          }
                        }
                        {
                          resourceMetadata: {
                            id: appGatewayId
                          }
                          name: 'FailedRequests'
                          aggregationType: 1
                          namespace: 'microsoft.network/applicationgateways'
                          metricVisualization: {
                            displayName: 'Failed Requests'
                            resourceDisplayName: 'appgateway246'
                          }
                        }
                      ]
                      title: 'Sum Total Requests and Sum Failed Requests for appgateway246'
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
                            id: appGatewayId
                          }
                          name: 'HealthyHostCount'
                          aggregationType: 4
                          namespace: 'microsoft.network/applicationgateways'
                          metricVisualization: {
                            displayName: 'Healthy Host Count'
                            resourceDisplayName: 'appgateway246'
                          }
                        }
                        {
                          resourceMetadata: {
                            id: appGatewayId
                          }
                          name: 'UnhealthyHostCount'
                          aggregationType: 4
                          namespace: 'microsoft.network/applicationgateways'
                          metricVisualization: {
                            displayName: 'Unhealthy Host Count'
                            resourceDisplayName: 'appgateway246'
                          }
                        }
                      ]
                      title: 'Avg Healthy Host Count and Avg Unhealthy Host Count for appgateway246'
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
                            id: appGatewayId
                          }
                          name: 'Throughput'
                          aggregationType: 4
                          namespace: 'microsoft.network/applicationgateways'
                          metricVisualization: {
                            displayName: 'Throughput'
                            resourceDisplayName: 'appgateway246'
                          }
                        }
                      ]
                      title: 'Avg Throughput for appgateway246'
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
                            id: appGatewayId
                          }
                          name: 'ApplicationGatewayTotalTime'
                          aggregationType: 4
                          namespace: 'microsoft.network/applicationgateways'
                          metricVisualization: {
                            displayName: 'Application Gateway Total Time'
                            resourceDisplayName: 'appgateway246'
                          }
                        }
                        {
                          resourceMetadata: {
                            id: appGatewayId
                          }
                          name: 'BackendConnectTime'
                          aggregationType: 4
                          namespace: 'microsoft.network/applicationgateways'
                          metricVisualization: {
                            displayName: 'Backend Connect Time'
                            resourceDisplayName: 'appgateway246'
                          }
                        }
                      ]
                      title: 'Avg Application Gateway Total Time and Avg Backend Connect Time for appgateway246'
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
              y: 8
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
                            id: appGatewayId
                          }
                          name: 'BackendFirstByteResponseTime'
                          aggregationType: 4
                          namespace: 'microsoft.network/applicationgateways'
                          metricVisualization: {
                            displayName: 'Backend First Byte Response Time'
                            resourceDisplayName: 'appgateway246'
                          }
                        }
                        {
                          resourceMetadata: {
                            id: appGatewayId
                          }
                          name: 'BackendLastByteResponseTime'
                          aggregationType: 4
                          namespace: 'microsoft.network/applicationgateways'
                          metricVisualization: {
                            displayName: 'Backend Last Byte Response Time'
                            resourceDisplayName: 'appgateway246'
                          }
                        }
                      ]
                      title: 'Avg Backend First Byte Response Time and Avg Backend Last Byte Response Time for appgateway246'
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
                'StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c777d83'
                'StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c777d95'
                'StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c777da1'
                'StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c777dad'
                'StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c777db9'
              ]
            }
          }
        }
      }
    }
  }
}