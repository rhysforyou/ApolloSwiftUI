//
//  API+App.swift
//  ApolloSwiftUI
//
//  Created by Rhys Powell on 9/2/20.
//  Copyright © 2020 Rhys Powell. All rights reserved.
//

import Foundation

typealias LaunchSummary = LaunchListQuery.Data.Launch.Launch

extension LaunchListQuery.Data.Launch.Launch {
    var missionPatchURL: URL? {
        guard let missionPatch = mission?.missionPatch else { return nil }
        return URL(string: missionPatch)
    }
}

extension LaunchListQuery.Data.Launch.Launch: Identifiable {}
