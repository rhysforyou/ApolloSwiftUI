//
//  LaunchDetail.swift
//  ApolloSwiftUI
//
//  Created by Rhys Powell on 9/2/20.
//  Copyright © 2020 Rhys Powell. All rights reserved.
//

import SwiftUI
import Apollo

struct LaunchDetail: View {
    var launchID: GraphQLID

    var body: some View {
        Text("Launch \(launchID)")
    }
}
