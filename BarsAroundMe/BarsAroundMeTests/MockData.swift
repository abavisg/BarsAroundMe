//
//  MockData.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import Foundation
import SwiftyJSON
@testable import BarsAroundMe

struct MockData{
    
    struct placesAroundLocationResponseWithData {
        static let responseData: [AnyHashable: Any] = [
            "html_attributions" : [],
            "next_page_token" : "CoQCAAEAAFX5ePdqojtvmDuzuQb8uEH33-QB2Cvy9BVWDWOK4BGvL6ZXPVUOkyHNQjrnW2qHhwRnYW26s8mf5IiQMwPZ9ljyR1m3jwr0I090t5UhbenKZp48wT8kVA3Ozd72BKM_2ILMamoa7aBcbcDQW1-3ngfpORxLfpVZruSE2kPHKerWCK831SOoZr7AyWwEABPNJUggX2_ZiwzJXMnaW-u2k9rU6E0S0FVknu0PzNbOwaUUu36WeK5bivBvkjW2sJY8ImJapGArIFctY94GsoeAMbIh0rTqlbNKlm1HT7mh5HElxqkX3r6UxA1zmYJbrsI4TXjvnJowcwlyVU1VYVEmEc4SEDG8uriQcRCFiHJnVMTjjrsaFIho10Z2Pop3n41D7P-GWkMsu2BY",
            "results" : [
                [
                    "geometry" : [
                        "location" : [
                            "lat" : -33.8627642,
                            "lng" : 151.1951861
                        ],
                        "viewport" : [
                            "northeast" : [
                                "lat" : -33.86172500000001,
                                "lng" : 151.1958665302915
                            ],
                            "southwest" : [
                                "lat" : -33.8658818,
                                "lng" : 151.1931685697085
                            ]
                        ]
                    ],
                    "icon" : "https://maps.gstatic.com/mapfiles/place_api/icons/restaurant-71.png",
                    "id" : "05bf6e9aa18b35f174f5076c348ce8e91e328aba",
                    "name" : "Flying Fish Restaurant & Bar",
                    "opening_hours" : [
                        "exceptional_date" : [],
                        "open_now" : false,
                        "weekday_text" : []
                    ],
                    "photos" : [
                        [
                            "height" : 3036,
                            "html_attributions" : [""
                            ],
                            "photo_reference" : "CoQBdwAAAK5zYjUHvEB34CQ5-nEHW72sQaSw3EG6yVZnGxw_szU1v3PRJoEAolaW7nyhoS3SZcQzUyT-ut7MYbrFnNYX3WqzPCIh9NE2heLrSiLXue4X3vDw3js61u5_kkaeiasyW4inGKZQWPAEKbK_UjVkq8rv272D-E6UbF9X_9iB9pUJEhD8t8CJ82o_l3RqF-0J_JXGGhRYkSWTwn0XRtxNS6bwonAkKtUtWg",
                            "width" : 4048
                        ]
                    ],
                    "place_id" : "ChIJm7Ex8UmuEmsR37p4Hm0D0VI",
                    "price_level" : 4,
                    "rating" : 4.4,
                    "reference" : "CmRRAAAAFkJuDar4iJpuEEErYY3tWMG9DpGOHrwK4Zv2kOXEcxSYQj655LGZu4sAMZRwvFzRvJXE8fiuJPjoYOmPcXhhvq4jPO8Ww6Vp20oMEPmTfQurlMe3GKhHctKeWYA2RI2HEhCT6RhxIRAXafiJyEABjpQ2GhRjtNQBIXlJoHZrWbrScBMgVkecBg",
                    "scope" : "GOOGLE",
                    "types" : [ "bar", "restaurant", "food", "point_of_interest", "establishment" ],
                    "vicinity" : "Lower Deck, Jones Bay Wharf, 19-21 Pirrama Road, Pyrmont"
                ],
                [
                    "geometry" : [
                        "location" : [
                            "lat" : -33.8698537,
                            "lng" : 151.1977208
                        ],
                        "viewport" : [
                            "northeast" : [
                                "lat" : -33.8685348697085,
                                "lng" : 151.1991237802915
                            ],
                            "southwest" : [
                                "lat" : -33.8712328302915,
                                "lng" : 151.1964258197085
                            ]
                        ]
                    ],
                    "icon" : "https://maps.gstatic.com/mapfiles/place_api/icons/bar-71.png",
                    "id" : "c2075046e4cb0763631f4d8a562f88fe8500ba25",
                    "name" : "Pyrmont Bridge Hotel",
                    "opening_hours" : [
                        "exceptional_date" : [],
                        "open_now" : true,
                        "weekday_text" : []
                    ],
                    "photos" : [
                        [
                            "height" : 536,
                            "html_attributions" : [
                                ""
                            ],
                            "photo_reference" : "CoQBdwAAAODHYS76RanHn1Wfa0cMePQz8MP44Twi7URRMIY_U3zYXXBZpH2cINqACL9gFgMN6CnyMlzTrLrWHcTwZHQYj_dfr2tc7P5AZDcqUCNvrOxnU9iEOs_X5an4WQhKlYNfKw66cNeITjY7quZiw3p35DVRdZiOsFs67f6cs0DuwTMEEhDGXyMNMTyzdGWpYI_dSJDdGhSgfjLxCdXGg5hQ9FdI2sPG48Zv0w",
                            "width" : 800
                        ]
                    ],
                    "place_id" : "ChIJAzQBQzeuEmsRh4OdJApC4MU",
                    "price_level" : 1,
                    "rating" : 3.7,
                    "reference" : "CmRSAAAAEXsRJxxzDVDUyzheGw_lQqZN8YPgei6VvBFaBvB7bMCj5RibzdHusQSA3X3j8746H-4SVUgBu4F-ibHAYOngz3T4nzpT6ez2fNMemYRqs_VJSFIArU0vmxYVqGc_IniEEhC4P5uf3KJ1pT7uJxONLJ_dGhQgUY5iOmeUvO3SzncxKkbb5dUvFA",
                    "scope" : "GOOGLE",
                    "types" : [ "bar", "point_of_interest", "establishment" ],
                    "vicinity" : "96 Union Street, Pyrmont"
                ]
                
            ],
            "status" : "OK"
            
        ]
        
        private static let json1:JSON = ["name": "Flying Fish Restaurant & Bar",
                                                           "id": "05bf6e9aa18b35f174f5076c348ce8e91e328aba",
                                                           "place_id": "ChIJm7Ex8UmuEmsR37p4Hm0D0VI",
                                                           "latitude": -33.8627642,
                                                           "longitude": 151.1951861
        ]
        private static let place1:Place = Place(withJSON: json1)
        private static let json2:JSON = ["name": "Pyrmont Bridge Hotel",
                                                           "id": "c2075046e4cb0763631f4d8a562f88fe8500ba25",
                                                           "place_id": "ChIJAzQBQzeuEmsRh4OdJApC4MU",
                                                           "latitude": -33.8698537,
                                                           "longitude": 151.1977208
            ]
        private static let place2:Place = Place(withJSON: json2)
        static let places: [Place] = [place1, place2]
    }
    
    struct placesAroundLocationResponseWithNoData {
        static let responseData: [AnyHashable: Any] = [
            "html_attributions" : [],
            "next_page_token" : "CoQCAAEAAFX5ePdqojtvmDuzuQb8uEH33-QB2Cvy9BVWDWOK4BGvL6ZXPVUOkyHNQjrnW2qHhwRnYW26s8mf5IiQMwPZ9ljyR1m3jwr0I090t5UhbenKZp48wT8kVA3Ozd72BKM_2ILMamoa7aBcbcDQW1-3ngfpORxLfpVZruSE2kPHKerWCK831SOoZr7AyWwEABPNJUggX2_ZiwzJXMnaW-u2k9rU6E0S0FVknu0PzNbOwaUUu36WeK5bivBvkjW2sJY8ImJapGArIFctY94GsoeAMbIh0rTqlbNKlm1HT7mh5HElxqkX3r6UxA1zmYJbrsI4TXjvnJowcwlyVU1VYVEmEc4SEDG8uriQcRCFiHJnVMTjjrsaFIho10Z2Pop3n41D7P-GWkMsu2BY",
            "results" : [],
            "status" : "OK"
            
        ]
        static let places: [Place] = [Place]()

    }

}
