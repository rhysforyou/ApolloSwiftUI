//
//  LaunchDetail.swift
//  ApolloSwiftUI
//
//  Created by Rhys Powell on 9/2/20.
//  Copyright © 2020 Rhys Powell. All rights reserved.
//

import SwiftUI
import Apollo
import KingfisherSwiftUI

struct LaunchDetail: View {
    @ObservedObject var resource: ApolloResource<LaunchDetailsQuery>

    init(launchID: GraphQLID) {
        resource = ApolloResource(query: LaunchDetailsQuery(id: launchID))
    }

    var body: some View {
        Group {
            if resource.launch != nil {
                LaunchDetailsContent(launch: resource.launch!)
            } else if resource.error != nil {
                Text(resource.error!.localizedDescription)
            } else {
                Text("Loading…")
            }
        }
        .onAppear(perform: resource.fetch)
        .navigationBarTitle("Launch Details", displayMode: .inline)
    }
}

struct LaunchDetailsContent: View {
    var launch: LaunchDetailsQuery.Data.Launch

    var missionPatchURL: URL? {
        guard let missionPatch = launch.mission?.missionPatch else {
            return nil
        }
        return URL(string: missionPatch)
    }

    var missionName: String? {
        launch.mission?.name
    }

    var rocketName: String? {
        if let rocketName = launch.rocket?.name, let rocketType = launch.rocket?.type {
            return "🚀 \(rocketName) (\(rocketType))"
        } else if let rocketName = launch.rocket?.name {
            return "🚀 \(rocketName)"
        }
        return nil
    }

    var launchSite: String? {
        if let launchSite = launch.site {
            return "Launching from \(launchSite)"
        }
        return nil
    }

    var navigationBarButton: Button<Text> {
        if launch.isBooked {
            return Button(action: {}) {
                Text("Cancel")
            }
        } else {
            return Button(action: {}) {
                Text("Book Now")
            }
        }
    }

    var body: some View {
        VStack {
            HStack(spacing: 16) {
                if missionPatchURL != nil {
                    KFImage(missionPatchURL)
                        .placeholder { Image("Placeholder").resizable() }
                        .resizable()
                        .frame(width: 128, height: 128)
                }

                VStack(alignment: .leading, spacing: 4) {
                    missionName.flatMap(Text.init)
                        .font(.headline)

                    rocketName.flatMap(Text.init)
                        .font(.body)

                    launchSite.flatMap(Text.init)
                        .font(.caption)
                }
                Spacer()
            }
            Spacer()
        }
        .padding()
        .navigationBarItems(trailing: navigationBarButton)
    }
}

#if DEBUG

struct LaunchDetailsContent_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LaunchDetailsContent(launch: .fixture)
                .navigationBarTitle("Launch Details", displayMode: .inline)
        }
    }
}

#endif
