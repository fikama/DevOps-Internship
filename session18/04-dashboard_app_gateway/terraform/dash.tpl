{
  "lenses": {
    "0": {
      "order": 0,
      "parts": {
        "0": {
          "position": {
            "x": 0,
            "y": 0,
            "colSpan": 6,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "options",
                "isOptional": true
              },
              {
                "name": "sharedTimeRange",
                "isOptional": true
              }
            ],
            "type": "Extension/HubsExtension/PartType/MonitorChartPart",
            "settings": {
              "content": {
                "options": {
                  "chart": {
                    "metrics": [
                      {
                        "resourceMetadata": {
                          "id": "${resourceID}"
                        },
                        "name": "TotalRequests",
                        "aggregationType": 1,
                        "namespace": "microsoft.network/applicationgateways",
                        "metricVisualization": {
                          "displayName": "Total Requests",
                          "resourceDisplayName": "${appgatewayname}"
                        }
                      },
                      {
                        "resourceMetadata": {
                          "id": "${resourceID}"
                        },
                        "name": "FailedRequests",
                        "aggregationType": 1,
                        "namespace": "microsoft.network/applicationgateways",
                        "metricVisualization": {
                          "displayName": "Failed Requests",
                          "resourceDisplayName": "${appgatewayname}"
                        }
                      }
                    ],
                    "title": "Sum Total Requests and Sum Failed Requests for ${appgatewayname}",
                    "titleKind": 1,
                    "visualization": {
                      "chartType": 2,
                      "legendVisualization": {
                        "isVisible": true,
                        "position": 2,
                        "hideSubtitle": false
                      },
                      "axisVisualization": {
                        "x": {
                          "isVisible": true,
                          "axisType": 2
                        },
                        "y": {
                          "isVisible": true,
                          "axisType": 1
                        }
                      },
                      "disablePinning": true
                    }
                  }
                }
              }
            }
          }
        },
        "1": {
          "position": {
            "x": 6,
            "y": 0,
            "colSpan": 6,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "options",
                "isOptional": true
              },
              {
                "name": "sharedTimeRange",
                "isOptional": true
              }
            ],
            "type": "Extension/HubsExtension/PartType/MonitorChartPart",
            "settings": {
              "content": {
                "options": {
                  "chart": {
                    "metrics": [
                      {
                        "resourceMetadata": {
                          "id": "${resourceID}"
                        },
                        "name": "HealthyHostCount",
                        "aggregationType": 4,
                        "namespace": "microsoft.network/applicationgateways",
                        "metricVisualization": {
                          "displayName": "Healthy Host Count",
                          "resourceDisplayName": "${appgatewayname}"
                        }
                      },
                      {
                        "resourceMetadata": {
                          "id": "${resourceID}"
                        },
                        "name": "UnhealthyHostCount",
                        "aggregationType": 4,
                        "namespace": "microsoft.network/applicationgateways",
                        "metricVisualization": {
                          "displayName": "Unhealthy Host Count",
                          "resourceDisplayName": "${appgatewayname}"
                        }
                      }
                    ],
                    "title": "Avg Healthy Host Count and Avg Unhealthy Host Count for ${appgatewayname}",
                    "titleKind": 1,
                    "visualization": {
                      "chartType": 2,
                      "legendVisualization": {
                        "isVisible": true,
                        "position": 2,
                        "hideSubtitle": false
                      },
                      "axisVisualization": {
                        "x": {
                          "isVisible": true,
                          "axisType": 2
                        },
                        "y": {
                          "isVisible": true,
                          "axisType": 1
                        }
                      },
                      "disablePinning": true
                    }
                  }
                }
              }
            }
          }
        },
        "2": {
          "position": {
            "x": 0,
            "y": 4,
            "colSpan": 6,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "options",
                "isOptional": true
              },
              {
                "name": "sharedTimeRange",
                "isOptional": true
              }
            ],
            "type": "Extension/HubsExtension/PartType/MonitorChartPart",
            "settings": {
              "content": {
                "options": {
                  "chart": {
                    "metrics": [
                      {
                        "resourceMetadata": {
                          "id": "${resourceID}"
                        },
                        "name": "Throughput",
                        "aggregationType": 4,
                        "namespace": "microsoft.network/applicationgateways",
                        "metricVisualization": {
                          "displayName": "Throughput",
                          "resourceDisplayName": "${appgatewayname}"
                        }
                      }
                    ],
                    "title": "Avg Throughput for ${appgatewayname}",
                    "titleKind": 1,
                    "visualization": {
                      "chartType": 2,
                      "legendVisualization": {
                        "isVisible": true,
                        "position": 2,
                        "hideSubtitle": false
                      },
                      "axisVisualization": {
                        "x": {
                          "isVisible": true,
                          "axisType": 2
                        },
                        "y": {
                          "isVisible": true,
                          "axisType": 1
                        }
                      },
                      "disablePinning": true
                    }
                  }
                }
              }
            }
          }
        },
        "3": {
          "position": {
            "x": 6,
            "y": 4,
            "colSpan": 6,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "options",
                "isOptional": true
              },
              {
                "name": "sharedTimeRange",
                "isOptional": true
              }
            ],
            "type": "Extension/HubsExtension/PartType/MonitorChartPart",
            "settings": {
              "content": {
                "options": {
                  "chart": {
                    "metrics": [
                      {
                        "resourceMetadata": {
                          "id": "${resourceID}"
                        },
                        "name": "ApplicationGatewayTotalTime",
                        "aggregationType": 4,
                        "namespace": "microsoft.network/applicationgateways",
                        "metricVisualization": {
                          "displayName": "Application Gateway Total Time",
                          "resourceDisplayName": "${appgatewayname}"
                        }
                      },
                      {
                        "resourceMetadata": {
                          "id": "${resourceID}"
                        },
                        "name": "BackendConnectTime",
                        "aggregationType": 4,
                        "namespace": "microsoft.network/applicationgateways",
                        "metricVisualization": {
                          "displayName": "Backend Connect Time",
                          "resourceDisplayName": "${appgatewayname}"
                        }
                      }
                    ],
                    "title": "Avg Application Gateway Total Time and Avg Backend Connect Time for ${appgatewayname}",
                    "titleKind": 1,
                    "visualization": {
                      "chartType": 2,
                      "legendVisualization": {
                        "isVisible": true,
                        "position": 2,
                        "hideSubtitle": false
                      },
                      "axisVisualization": {
                        "x": {
                          "isVisible": true,
                          "axisType": 2
                        },
                        "y": {
                          "isVisible": true,
                          "axisType": 1
                        }
                      },
                      "disablePinning": true
                    }
                  }
                }
              }
            }
          }
        },
        "4": {
          "position": {
            "x": 0,
            "y": 8,
            "colSpan": 6,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "options",
                "isOptional": true
              },
              {
                "name": "sharedTimeRange",
                "isOptional": true
              }
            ],
            "type": "Extension/HubsExtension/PartType/MonitorChartPart",
            "settings": {
              "content": {
                "options": {
                  "chart": {
                    "metrics": [
                      {
                        "resourceMetadata": {
                          "id": "${resourceID}"
                        },
                        "name": "BackendFirstByteResponseTime",
                        "aggregationType": 4,
                        "namespace": "microsoft.network/applicationgateways",
                        "metricVisualization": {
                          "displayName": "Backend First Byte Response Time",
                          "resourceDisplayName": "${appgatewayname}"
                        }
                      },
                      {
                        "resourceMetadata": {
                          "id": "${resourceID}"
                        },
                        "name": "BackendLastByteResponseTime",
                        "aggregationType": 4,
                        "namespace": "microsoft.network/applicationgateways",
                        "metricVisualization": {
                          "displayName": "Backend Last Byte Response Time",
                          "resourceDisplayName": "${appgatewayname}"
                        }
                      }
                    ],
                    "title": "Avg Backend First Byte Response Time and Avg Backend Last Byte Response Time for ${appgatewayname}",
                    "titleKind": 1,
                    "visualization": {
                      "chartType": 2,
                      "legendVisualization": {
                        "isVisible": true,
                        "position": 2,
                        "hideSubtitle": false
                      },
                      "axisVisualization": {
                        "x": {
                          "isVisible": true,
                          "axisType": 2
                        },
                        "y": {
                          "isVisible": true,
                          "axisType": 1
                        }
                      },
                      "disablePinning": true
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  "metadata": {
    "model": {
      "timeRange": {
        "value": {
          "relative": {
            "duration": 24,
            "timeUnit": 1
          }
        },
        "type": "MsPortalFx.Composition.Configuration.ValueTypes.TimeRange"
      },
      "filterLocale": {
        "value": "en-us"
      },
      "filters": {
        "value": {
          "MsPortalFx_TimeRange": {
            "model": {
              "format": "utc",
              "granularity": "auto",
              "relative": "24h"
            },
            "displayCache": {
              "name": "UTC Time",
              "value": "Past 24 hours"
            },
            "filteredPartIds": [
              "StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c777d83",
              "StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c777d95",
              "StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c777da1",
              "StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c777dad",
              "StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c777db9"
            ]
          }
        }
      }
    }
  }
}