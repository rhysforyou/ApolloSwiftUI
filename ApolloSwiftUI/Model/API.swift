//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LaunchDetailsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query LaunchDetails($id: ID!) {
      launch(id: $id) {
        __typename
        id
        site
        mission {
          __typename
          name
          missionPatch(size: LARGE)
        }
        rocket {
          __typename
          name
          type
        }
        isBooked
      }
    }
    """

  public let operationName = "LaunchDetails"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("launch", arguments: ["id": GraphQLVariable("id")], type: .object(Launch.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(launch: Launch? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "launch": launch.flatMap { (value: Launch) -> ResultMap in value.resultMap }])
    }

    public var launch: Launch? {
      get {
        return (resultMap["launch"] as? ResultMap).flatMap { Launch(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "launch")
      }
    }

    public struct Launch: GraphQLSelectionSet {
      public static let possibleTypes = ["Launch"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("site", type: .scalar(String.self)),
        GraphQLField("mission", type: .object(Mission.selections)),
        GraphQLField("rocket", type: .object(Rocket.selections)),
        GraphQLField("isBooked", type: .nonNull(.scalar(Bool.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, site: String? = nil, mission: Mission? = nil, rocket: Rocket? = nil, isBooked: Bool) {
        self.init(unsafeResultMap: ["__typename": "Launch", "id": id, "site": site, "mission": mission.flatMap { (value: Mission) -> ResultMap in value.resultMap }, "rocket": rocket.flatMap { (value: Rocket) -> ResultMap in value.resultMap }, "isBooked": isBooked])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var site: String? {
        get {
          return resultMap["site"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "site")
        }
      }

      public var mission: Mission? {
        get {
          return (resultMap["mission"] as? ResultMap).flatMap { Mission(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "mission")
        }
      }

      public var rocket: Rocket? {
        get {
          return (resultMap["rocket"] as? ResultMap).flatMap { Rocket(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "rocket")
        }
      }

      public var isBooked: Bool {
        get {
          return resultMap["isBooked"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isBooked")
        }
      }

      public struct Mission: GraphQLSelectionSet {
        public static let possibleTypes = ["Mission"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("missionPatch", arguments: ["size": "LARGE"], type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, missionPatch: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Mission", "name": name, "missionPatch": missionPatch])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var missionPatch: String? {
          get {
            return resultMap["missionPatch"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "missionPatch")
          }
        }
      }

      public struct Rocket: GraphQLSelectionSet {
        public static let possibleTypes = ["Rocket"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("type", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, type: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Rocket", "name": name, "type": type])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }
      }
    }
  }
}

public final class LaunchListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query LaunchList {
      launches {
        __typename
        cursor
        hasMore
        launches {
          __typename
          id
          site
          mission {
            __typename
            name
            missionPatch(size: SMALL)
          }
        }
      }
    }
    """

  public let operationName = "LaunchList"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("launches", type: .nonNull(.object(Launch.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(launches: Launch) {
      self.init(unsafeResultMap: ["__typename": "Query", "launches": launches.resultMap])
    }

    public var launches: Launch {
      get {
        return Launch(unsafeResultMap: resultMap["launches"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "launches")
      }
    }

    public struct Launch: GraphQLSelectionSet {
      public static let possibleTypes = ["LaunchConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
        GraphQLField("hasMore", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("launches", type: .nonNull(.list(.object(Launch.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(cursor: String, hasMore: Bool, launches: [Launch?]) {
        self.init(unsafeResultMap: ["__typename": "LaunchConnection", "cursor": cursor, "hasMore": hasMore, "launches": launches.map { (value: Launch?) -> ResultMap? in value.flatMap { (value: Launch) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var cursor: String {
        get {
          return resultMap["cursor"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "cursor")
        }
      }

      public var hasMore: Bool {
        get {
          return resultMap["hasMore"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "hasMore")
        }
      }

      public var launches: [Launch?] {
        get {
          return (resultMap["launches"] as! [ResultMap?]).map { (value: ResultMap?) -> Launch? in value.flatMap { (value: ResultMap) -> Launch in Launch(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Launch?) -> ResultMap? in value.flatMap { (value: Launch) -> ResultMap in value.resultMap } }, forKey: "launches")
        }
      }

      public struct Launch: GraphQLSelectionSet {
        public static let possibleTypes = ["Launch"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("site", type: .scalar(String.self)),
          GraphQLField("mission", type: .object(Mission.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, site: String? = nil, mission: Mission? = nil) {
          self.init(unsafeResultMap: ["__typename": "Launch", "id": id, "site": site, "mission": mission.flatMap { (value: Mission) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var site: String? {
          get {
            return resultMap["site"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "site")
          }
        }

        public var mission: Mission? {
          get {
            return (resultMap["mission"] as? ResultMap).flatMap { Mission(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "mission")
          }
        }

        public struct Mission: GraphQLSelectionSet {
          public static let possibleTypes = ["Mission"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("missionPatch", arguments: ["size": "SMALL"], type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, missionPatch: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Mission", "name": name, "missionPatch": missionPatch])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var missionPatch: String? {
            get {
              return resultMap["missionPatch"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "missionPatch")
            }
          }
        }
      }
    }
  }
}
