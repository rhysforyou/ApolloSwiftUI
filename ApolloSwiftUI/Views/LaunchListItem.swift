//
//  LaunchListItem.swift
//  ApolloSwiftUI
//
//  Created by Rhys Powell on 9/2/20.
//  Copyright © 2020 Rhys Powell. All rights reserved.
//

import SwiftUI
import Apollo
import KingfisherSwiftUI

struct LaunchListItem: View {
    let launch: LaunchSummary

    var body: some View {
        HStack {
            KFImage(launch.missionPatchURL)
                .resizable()
                .placeholder {
                    Circle()
                        .foregroundColor(Color(UIColor.secondarySystemBackground))
                }
                .frame(width: 44, height: 44)
            VStack(alignment: .leading) {
                Text(launch.mission?.name ?? "Unknown Mission")
                    .font(.body)
                Text(launch.site ?? "Unknown Site")
                    .font(.caption)
            }
        }
    }
}

#if DEBUG

struct LaunchListItem_Previews: PreviewProvider {
    static var previews: some View {
        LaunchListItem(launch: .fixture)
    }
}

#endif
