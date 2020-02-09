//
//  LaunchList.swift
//  ApolloSwiftUI
//
//  Created by Rhys Powell on 9/2/20.
//  Copyright © 2020 Rhys Powell. All rights reserved.
//

import SwiftUI
import Apollo

struct LaunchList: View {
    @ObservedObject var resource = ApolloResource(query: LaunchListQuery())

    var body: some View {
        List(resource.launches) { launch in
            NavigationLink(destination: LaunchDetail(launchID: launch.id)) {
                LaunchListItem(launch: launch)
            }
        }
        .alert(isPresented: $resource.shouldPresentError) {
            Alert(
                title: Text("GraphQL Error"),
                message: Text(resource.error?.localizedDescription ?? "Something went wrong"),
                dismissButton: .cancel(Text("Okay"))
            )
        }
        .onAppear(perform: resource.fetch)
        .navigationBarTitle("Launches")
    }
}
