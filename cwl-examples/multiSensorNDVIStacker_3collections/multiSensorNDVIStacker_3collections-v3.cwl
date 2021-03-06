{  
   "cwlVersion":"v1.0",
   "class":"Workflow",
   "requirements": [
      {"class": "MultipleInputFeatureRequirement"}
      ],
   "inputs":{  
      "image-collection1":"File",
      "image-collection2":"File",
      "image-collection3":"File"
   },
   "outputs":{  
      "classout":{  
         "type":"File",
         "outputSource":"Stacker/output"
      }
   },
   "steps":{  
      "NDVIMultiSensorCollection1":{  
         "run":"GeomatysNDVIMultiSensor.cwl",
         "in":{  
            "files":"image-collection1"
         },
         "out":[  
            "output"
         ]
      },
      "NDVIMultiSensorCollection2":{  
         "run":"GeomatysNDVIMultiSensor.cwl",
         "in":{  
            "files":"image-collection2"
         },
         "out":[  
            "output"
         ]
      },
      "NDVIMultiSensorCollection3":{  
         "run":"GeomatysNDVIMultiSensor.cwl",
         "in":{  
            "files":"image-collection3"
         },
         "out":[  
            "output"
         ]
      },
      "Stacker":{  
         "run":"GeomatysNDVIStacker.cwl",
         "in": {
            "files": {
              "linkMerge": "merge_flattened",
              "source": [
                "NDVIMultiSensorCollection1/output",
                "NDVIMultiSensorCollection2/output",
                "NDVIMultiSensorCollection3/output"
              ]
            }
        },
         "out":[  
            "output"
         ]
      }
   }
}