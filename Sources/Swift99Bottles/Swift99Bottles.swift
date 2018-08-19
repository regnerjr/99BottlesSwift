import Foundation

class Swift99Bottles {

  func song() -> String {
    return verses(99, 0)
  }

  func verses(_ start: Int, _ end: Int) -> String {
    return (end...start).reversed().map({verse($0)}).joined(separator: "\n")
  }

  func verse(_ num: Int) -> String {
    let number = BottleNumber(with: num)

    return """
    \(number.description.capitalize()) of beer on the wall, \
    \(number) of beer.
    \(number.action()) \
    \(number.next()) of beer on the wall.

    """
  }
}

class BottleNumber: NSObject {

  private let num: Int

  required init(with num: Int) {
    self.num = num
  }

  override var description: String {
    return quantity() + " " + container()
  }

  func container() -> String {
    if num == 1 {
      return "bottle"
    } else {
      return "bottles"
    }
  }

  func pronoun() -> String {
    if num == 1 {
      return "it"
    } else {
      return "one"
    }
  }

  func quantity() -> String {
    if num == 0 {
      return "no more"
    } else {
      return "\(num)"
    }
  }

  func action() -> String {
    if num == 0 {
      return "Go to the store and buy some more,"
    } else {
      return "Take \(pronoun()) down and pass it around,"
    }
  }

  func next() -> BottleNumber {
    if num == 0 {
      return BottleNumber(with: 99)
    } else {
      return BottleNumber(with: num - 1)
    }
  }
}
