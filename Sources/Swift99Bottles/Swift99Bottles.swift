struct Swift99Bottles {

  let NoMore: (Verse) -> String = { verse in
       return """
         No more bottles of beer on the wall, no more bottles of beer.
         Go to the store and buy some more, 99 bottles of beer on the wall.

         """
    }

  let LastOne: (Verse) -> String = { verse in
      return """
        1 bottle of beer on the wall, 1 bottle of beer.
        Take it down and pass it around, no more bottles of beer on the wall.

        """
    }

  let Penultimate: (Verse) -> String = { verse in
      return """
        2 bottles of beer on the wall, 2 bottles of beer.
        Take one down and pass it around, 1 bottle of beer on the wall.

        """
    }

  let Default: (Verse) -> String = { verse in
      return """
        \(verse.number) bottles of beer on the wall, \(verse.number) bottles of beer.
        Take one down and pass it around, \(verse.number-1) bottles of beer on the wall.

        """
    }

    func song() -> String {
        return verses(99, 0)
    }

    func verses(_ finish: Int, _ start: Int) -> String {
        return (start...finish).reversed().map { verse_number in
            verse(verse_number)
        }.joined(separator: "\n")
    }

    func verse(_ number: Int) -> String {
        return verse_for(number).text
    }

    func verse_for(_ number: Int) -> Verse {
        switch number {
        case 0:
            return Verse(number, NoMore)
        case 1:
            return Verse(number, LastOne)
        case 2:
            return Verse(number, Penultimate)
        default:
            return Verse(number, Default)
        }
    }
}

class Verse {

    let number: Int
    let block: (Verse) -> String

    var text: String {
        return block(self)
    }

    init(_ number: Int, _ block: @escaping (Verse)->String) {
        self.number = number
        self.block = block
    }
}
