//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum TransactionType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case regular
  case cashback
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "REGULAR": self = .regular
      case "CASHBACK": self = .cashback
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .regular: return "REGULAR"
      case .cashback: return "CASHBACK"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: TransactionType, rhs: TransactionType) -> Bool {
    switch (lhs, rhs) {
      case (.regular, .regular): return true
      case (.cashback, .cashback): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [TransactionType] {
    return [
      .regular,
      .cashback,
    ]
  }
}

public enum CurrencyCode: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case gbp
  case rub
  case usd
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "GBP": self = .gbp
      case "RUB": self = .rub
      case "USD": self = .usd
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .gbp: return "GBP"
      case .rub: return "RUB"
      case .usd: return "USD"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: CurrencyCode, rhs: CurrencyCode) -> Bool {
    switch (lhs, rhs) {
      case (.gbp, .gbp): return true
      case (.rub, .rub): return true
      case (.usd, .usd): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [CurrencyCode] {
    return [
      .gbp,
      .rub,
      .usd,
    ]
  }
}

public final class TransactionsFeedQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query TransactionsFeed {
      dailyTransactionsFeed {
        __typename
        ... on DaySectionWidget {
          ...DaySection
        }
        ... on TransactionWidget {
          ...Transaction
        }
      }
    }
    """

  public let operationName = "TransactionsFeed"

  public var queryDocument: String { return operationDefinition.appending(DaySection.fragmentDefinition).appending(Money.fragmentDefinition).appending(Transaction.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("dailyTransactionsFeed", type: .list(.object(DailyTransactionsFeed.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(dailyTransactionsFeed: [DailyTransactionsFeed?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "dailyTransactionsFeed": dailyTransactionsFeed.flatMap { (value: [DailyTransactionsFeed?]) -> [ResultMap?] in value.map { (value: DailyTransactionsFeed?) -> ResultMap? in value.flatMap { (value: DailyTransactionsFeed) -> ResultMap in value.resultMap } } }])
    }

    public var dailyTransactionsFeed: [DailyTransactionsFeed?]? {
      get {
        return (resultMap["dailyTransactionsFeed"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [DailyTransactionsFeed?] in value.map { (value: ResultMap?) -> DailyTransactionsFeed? in value.flatMap { (value: ResultMap) -> DailyTransactionsFeed in DailyTransactionsFeed(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [DailyTransactionsFeed?]) -> [ResultMap?] in value.map { (value: DailyTransactionsFeed?) -> ResultMap? in value.flatMap { (value: DailyTransactionsFeed) -> ResultMap in value.resultMap } } }, forKey: "dailyTransactionsFeed")
      }
    }

    public struct DailyTransactionsFeed: GraphQLSelectionSet {
      public static let possibleTypes = ["DaySectionWidget", "TransactionWidget"]

      public static let selections: [GraphQLSelection] = [
        GraphQLTypeCase(
          variants: ["DaySectionWidget": AsDaySectionWidget.selections, "TransactionWidget": AsTransactionWidget.selections],
          default: [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          ]
        )
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var asDaySectionWidget: AsDaySectionWidget? {
        get {
          if !AsDaySectionWidget.possibleTypes.contains(__typename) { return nil }
          return AsDaySectionWidget(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsDaySectionWidget: GraphQLSelectionSet {
        public static let possibleTypes = ["DaySectionWidget"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(DaySection.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var daySection: DaySection {
            get {
              return DaySection(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public var asTransactionWidget: AsTransactionWidget? {
        get {
          if !AsTransactionWidget.possibleTypes.contains(__typename) { return nil }
          return AsTransactionWidget(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsTransactionWidget: GraphQLSelectionSet {
        public static let possibleTypes = ["TransactionWidget"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(Transaction.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var transaction: Transaction {
            get {
              return Transaction(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public struct DaySection: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment DaySection on DaySectionWidget {
      __typename
      date
      amount {
        __typename
        ...Money
      }
    }
    """

  public static let possibleTypes = ["DaySectionWidget"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("date", type: .nonNull(.scalar(String.self))),
    GraphQLField("amount", type: .nonNull(.object(Amount.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(date: String, amount: Amount) {
    self.init(unsafeResultMap: ["__typename": "DaySectionWidget", "date": date, "amount": amount.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var date: String {
    get {
      return resultMap["date"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "date")
    }
  }

  public var amount: Amount {
    get {
      return Amount(unsafeResultMap: resultMap["amount"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "amount")
    }
  }

  public struct Amount: GraphQLSelectionSet {
    public static let possibleTypes = ["Money"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(Money.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(value: String, currencyCode: CurrencyCode) {
      self.init(unsafeResultMap: ["__typename": "Money", "value": value, "currencyCode": currencyCode])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var money: Money {
        get {
          return Money(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct Transaction: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment Transaction on TransactionWidget {
      __typename
      transaction {
        __typename
        id
        type
        title
        amount {
          __typename
          ...Money
        }
      }
      image {
        __typename
        iconName
      }
    }
    """

  public static let possibleTypes = ["TransactionWidget"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("transaction", type: .nonNull(.object(Transaction.selections))),
    GraphQLField("image", type: .object(Image.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(transaction: Transaction, image: Image? = nil) {
    self.init(unsafeResultMap: ["__typename": "TransactionWidget", "transaction": transaction.resultMap, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var transaction: Transaction {
    get {
      return Transaction(unsafeResultMap: resultMap["transaction"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "transaction")
    }
  }

  public var image: Image? {
    get {
      return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "image")
    }
  }

  public struct Transaction: GraphQLSelectionSet {
    public static let possibleTypes = ["Transaction"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
      GraphQLField("title", type: .nonNull(.scalar(String.self))),
      GraphQLField("amount", type: .nonNull(.object(Amount.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, type: TransactionType, title: String, amount: Amount) {
      self.init(unsafeResultMap: ["__typename": "Transaction", "id": id, "type": type, "title": title, "amount": amount.resultMap])
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

    public var type: TransactionType {
      get {
        return resultMap["type"]! as! TransactionType
      }
      set {
        resultMap.updateValue(newValue, forKey: "type")
      }
    }

    public var title: String {
      get {
        return resultMap["title"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "title")
      }
    }

    public var amount: Amount {
      get {
        return Amount(unsafeResultMap: resultMap["amount"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "amount")
      }
    }

    public struct Amount: GraphQLSelectionSet {
      public static let possibleTypes = ["Money"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(Money.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(value: String, currencyCode: CurrencyCode) {
        self.init(unsafeResultMap: ["__typename": "Money", "value": value, "currencyCode": currencyCode])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var money: Money {
          get {
            return Money(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }

  public struct Image: GraphQLSelectionSet {
    public static let possibleTypes = ["Image"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("iconName", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(iconName: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Image", "iconName": iconName])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var iconName: String? {
      get {
        return resultMap["iconName"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "iconName")
      }
    }
  }
}

public struct Money: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment Money on Money {
      __typename
      value
      currencyCode
    }
    """

  public static let possibleTypes = ["Money"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("value", type: .nonNull(.scalar(String.self))),
    GraphQLField("currencyCode", type: .nonNull(.scalar(CurrencyCode.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(value: String, currencyCode: CurrencyCode) {
    self.init(unsafeResultMap: ["__typename": "Money", "value": value, "currencyCode": currencyCode])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var value: String {
    get {
      return resultMap["value"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "value")
    }
  }

  public var currencyCode: CurrencyCode {
    get {
      return resultMap["currencyCode"]! as! CurrencyCode
    }
    set {
      resultMap.updateValue(newValue, forKey: "currencyCode")
    }
  }
}
