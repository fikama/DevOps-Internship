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
                        "name": "IoReadOperationsPerSecond",
                        "aggregationType": 1,
                        "namespace": "microsoft.web/sites",
                        "metricVisualization": {
                          "displayName": "IO Read Operations Per Second",
                          "resourceDisplayName": "${appServiceName}"
                        }
                      },
                      {
                        "resourceMetadata": {
                          "id": "${resourceID}"
                        },
                        "name": "HttpResponseTime",
                        "aggregationType": 4,
                        "namespace": "microsoft.web/sites",
                        "metricVisualization": {
                          "displayName": "Response Time",
                          "resourceDisplayName": "${appServiceName}"
                        }
                      },
                      {
                        "resourceMetadata": {
                          "id": "${resourceID}"
                        },
                        "name": "HttpResponseTime",
                        "aggregationType": 3,
                        "namespace": "microsoft.web/sites",
                        "metricVisualization": {
                          "displayName": "Response Time",
                          "resourceDisplayName": "${appServiceName}"
                        }
                      },
                      {
                        "resourceMetadata": {
                          "id": "${resourceID}"
                        },
                        "name": "RequestsInApplicationQueue",
                        "aggregationType": 4,
                        "namespace": "microsoft.web/sites",
                        "metricVisualization": {
                          "displayName": "Requests In Application Queue",
                          "resourceDisplayName": "${appServiceName}"
                        }
                      },
                      {
                        "resourceMetadata": {
                          "id": "${resourceID}"
                        },
                        "name": "RequestsInApplicationQueue",
                        "aggregationType": 3,
                        "namespace": "microsoft.web/sites",
                        "metricVisualization": {
                          "displayName": "Requests In Application Queue",
                          "resourceDisplayName": "${appServiceName}"
                        }
                      }
                    ],
                    "title": "Sum IO Read Operations Per Second, Avg Response Time, and 3 other metrics for ${appServiceName}",
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
                        "name": "CpuTime",
                        "aggregationType": 1,
                        "namespace": "microsoft.web/sites",
                        "metricVisualization": {
                          "displayName": "CPU Time",
                          "resourceDisplayName": "${appServiceName}"
                        }
                      }
                    ],
                    "title": "Sum CPU Time for ${appServiceName}",
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
                        "name": "MemoryWorkingSet",
                        "aggregationType": 4,
                        "namespace": "microsoft.web/sites",
                        "metricVisualization": {
                          "displayName": "Memory working set",
                          "resourceDisplayName": "${appServiceName}"
                        }
                      },
                      {
                        "resourceMetadata": {
                          "id": "${resourceID}"
                        },
                        "name": "MemoryWorkingSet",
                        "aggregationType": 3,
                        "namespace": "microsoft.web/sites",
                        "metricVisualization": {
                          "displayName": "Memory working set",
                          "resourceDisplayName": "${appServiceName}"
                        }
                      }
                    ],
                    "title": "Avg Memory working set and Max Memory working set for ${appServiceName}",
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
                        "name": "Http101",
                        "aggregationType": 1,
                        "namespace": "microsoft.web/sites",
                        "metricVisualization": {
                          "displayName": "Http 101",
                          "resourceDisplayName": "${appServiceName}"
                        }
                      },
                      {
                        "resourceMetadata": {
                          "id": "${resourceID}"
                        },
                        "name": "Http2xx",
                        "aggregationType": 1,
                        "namespace": "microsoft.web/sites",
                        "metricVisualization": {
                          "displayName": "Http 2xx",
                          "resourceDisplayName": "${appServiceName}"
                        }
                      },
                      {
                        "resourceMetadata": {
                          "id": "${resourceID}"
                        },
                        "name": "Http3xx",
                        "aggregationType": 1,
                        "namespace": "microsoft.web/sites",
                        "metricVisualization": {
                          "displayName": "Http 3xx",
                          "resourceDisplayName": "${appServiceName}"
                        }
                      },
                      {
                        "resourceMetadata": {
                          "id": "${resourceID}"
                        },
                        "name": "Http4xx",
                        "aggregationType": 1,
                        "namespace": "microsoft.web/sites",
                        "metricVisualization": {
                          "displayName": "Http 4xx",
                          "resourceDisplayName": "${appServiceName}"
                        }
                      }
                    ],
                    "title": "Sum Http 101, Sum Http 2xx, and 2 other metrics for ${appServiceName}",
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
              "StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c777184",
              "StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c777196",
              "StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c7771a2",
              "StartboardPart-MonitorChartPart-edce2f42-b144-48db-97d5-c3bf3c7771ae"
            ]
          }
        }
      }
    }
  }
}