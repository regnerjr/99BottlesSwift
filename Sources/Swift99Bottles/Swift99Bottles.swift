import Foundation

class Swift99Bottles {

  func song() -> String {
    return verses(99, 0)
  }

  func verses(_ start: Int, _ end: Int) -> String {
    return (end...start).reversed().map({verse($0)}).joined(separator: "\n")
  }

  func verse(_ num: Int) -> String {
    let number = BottleFactory.make(num)

    return """
    \(number.description.capitalize()) of beer on the wall, \
    \(number) of beer.
    \(number.action()) \
    \(number.next()) of beer on the wall.

    """
  }
}


class BottleFactory {

  static func make(_ num: Int) -> BottleNumber {
    switch num {
    case 0: return BottleNumber0(with: num)
    case 1: return BottleNumber1(with: num)
    default: return BottleNumber(with: num)
    }
  }
}

@objc(BottleNumber)
class BottleNumber: NSObject {

  private let num: Int

  required init(with num: Int) {
    self.num = num
  }

  override var description: String {
    return quantity() + " " + container()
  }

  func container() -> String {
      return "bottles"
  }

  func pronoun() -> String {
      return "one"
  }

  func quantity() -> String {
      return "\(num)"
    }

  func action() -> String {
      return "Take \(pronoun()) down and pass it around,"
  }

  func next() -> BottleNumber {
    return BottleFactory.make(num - 1)
  }
}

@objc(BottleNumber1)
class BottleNumber1: BottleNumber {
  override func container() -> String {
    return "bottle"
  }
  override func pronoun() -> String {
    return "it"
  }
}

@objc(BottleNumber0)
class BottleNumber0: BottleNumber {
  override func quantity() -> String {
    return "no more"
  }
  override func action() -> String {
    return "Go to the store and buy some more,"
  }
  override func next() -> BottleNumber {
    return BottleFactory.make(99)
  }
}
