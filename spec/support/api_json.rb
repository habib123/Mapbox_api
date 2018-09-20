# only consider follwoing attributes features: {text: "" } and context: {postcode.12121:"", text: ""}
JSON_DATA_COFFEE = {
    "features":[
      {
        "id":"poi.6634419661645220",
        "text":"Starbucks",
        "place_name":"Starbucks, 1425 new work, Washington, District",
        "context":[{"id":"neighborhood.295089","text":"Logan Circle"},
                   {"id":"postcode.7672698105367510","text":"20005"}
                ]
      },
      {
        "id":"poi.6634419661645221",
        "text":"Starbucks_test",
        "place_name":"Starbucks11, 1425 P St NW, Washington,20005, United States",
        "context":[{"id":"neighborhood.295089","text":"Logan Circle"},
                   {"id":"postcode.7672698105367510","text":"20005"}
                ]
      },
      {
        "id":"poi.6634419661645220",
        "text":"differentCoffee",
        "place_name":"Starbucks, 1425 P St NW,District of Columbia 20005, United States",
        "context":[{"id":"neighborhood.295089","text":"Logan Circle"},
                   {"id":"postcode.7672698105367511","text":"20007"}
                ]
      }
    ]
  }


JSON_DATA_GALLERY =
  {
    "features": [
      {
        "id":"poi.2456809",
        "text":"Gallery Plan B",
        "context":[
          {"id":"neighborhood.295089","text":"Logan Circle"},
          {"id":"postcode.7672698105367510","text":"20005"}
        ]
      },
      {
        "id":"poi.2456809","type":"Feature","place_type":["poi"],"relevance":1,
        "text":"Gallery Plan D",
        "context":[
          {"id":"neighborhood.295089","text":"Logan Circle"},
          {"id":"postcode.7672698105367510","text":"20005"}
        ]
      },
      {
        "id":"poi.2456809","type":"Feature","place_type":["poi"],
        "text":"Gallery Plan R",
        "context":[
          {"id":"neighborhood.295089","text":"Logan Circle"},
          {"id":"postcode.7672698105367510","text":"20009"}
        ]
      }
    ]
  }
