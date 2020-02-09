//
//  Network.swift
//  ApolloSwiftUI
//
//  Created by Rhys Powell on 7/2/20.
//  Copyright © 2020 Rhys Powell. All rights reserved.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://n1kqy.sse.codesandbox.io/")!)
}

