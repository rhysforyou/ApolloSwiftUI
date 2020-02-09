//
//  ApolloResource.swift
//  ApolloSwiftUI
//
//  Created by Rhys Powell on 7/2/20.
//  Copyright © 2020 Rhys Powell. All rights reserved.
//

import Foundation
import Apollo

final class ApolloResource<Query: GraphQLQuery>: ObservableObject {
    let client: ApolloClient
    let query: Query

    @Published var result: Result<GraphQLResult<Query.Data>, Error>?
    @Published var shouldPresentError = false

    init(client: ApolloClient = Network.shared.apollo, query: Query) {
        self.client = client
        self.query = query
    }

    func fetch() {
        client.fetch(query: query) { [weak self] result in
            self?.result = result
            if case .failure = result {
                self?.shouldPresentError = true
            }
        }
    }

    var error: Error? {
        if case .failure(let error) = result {
            return error
        }
        return nil
    }
}

extension ApolloResource where Query == LaunchListQuery {
    var launches: [LaunchListQuery.Data.Launch.Launch] {
        if case let .success(data) = result {
            return data.data?.launches.launches.compactMap { $0 } ?? []
        }
        return []
    }
}
