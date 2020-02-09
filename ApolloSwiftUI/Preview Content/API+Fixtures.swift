//
//  API+Fixtures.swift
//  ApolloSwiftUI
//
//  Created by Rhys Powell on 9/2/20.
//  Copyright © 2020 Rhys Powell. All rights reserved.
//

import Foundation

#if DEBUG

extension LaunchListQuery.Data.Launch.Launch {
    static var fixture: LaunchListQuery.Data.Launch.Launch {
        LaunchListQuery.Data.Launch.Launch(
            id: "89",
            site: "CCAFS SLC 40",
            mission: LaunchListQuery.Data.Launch.Launch.Mission(
                name: "Starlink 3",
                missionPatch: "https://images2.imgbox.com/9a/96/nLppz9HW_o.png"
            )
        )
    }
}

extension LaunchDetailsQuery.Data.Launch {
    static var fixture: LaunchDetailsQuery.Data.Launch {
        return LaunchDetailsQuery.Data.Launch(
            id: "89",
            site: "CCAFS SLC 40",
            mission: LaunchDetailsQuery.Data.Launch.Mission(
                name: "Starlink 3",
                missionPatch: "https://images2.imgbox.com/d2/3b/bQaWiil0_o.png"
            ),
            rocket: LaunchDetailsQuery.Data.Launch.Rocket(
                name: "Falcon 9",
                type: "FT"
            ),
            isBooked: false
        )
    }
}

#endif
