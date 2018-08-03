struct Swift99Bottles {

    func song() -> String {
        return verses(99, 0)
    }

    func verses(_ bottles_at_start: Int, _ bottles_at_end: Int) -> String {
        return (bottles_at_end...bottles_at_start).reversed().map { bottles in
            verse(bottles)
        }.joined(separator: "\n")
    }

    func verse(_ bottles: Int) -> String {
        return Round(bottles).to_string()
    }
}

class Round {

    private(set) var bottles: Int

    init(_ bottles: Int) {
        self.bottles = bottles
    }

    func to_string() -> String {
        return challenge + response
    }

    var challenge: String {
        return bottles_of_beer.capitalize + " " + on_wall + ", " + bottles_of_beer + ".\n"
    }

    var response: String {
        return go_to_the_store_or_take_one_down + ", " + bottles_of_beer + " " + on_wall + ".\n"
    }

    var bottles_of_beer: String {
        return "\(anglicized_bottle_count) \(pluralized_bottle_form) of \(beer)"
    }

    var beer: String {
        return "beer"
    }

    var on_wall: String {
        return "on the wall"
    }

    var pluralized_bottle_form: String {
        return last_beer ? "bottle" : "bottles"
    }

    var anglicized_bottle_count: String {
        return all_out ? "no more" : String(bottles)
    }

    var go_to_the_store_or_take_one_down: String {
        if all_out {
            self.bottles = 99
            return buy_new_beer
        } else {
            let lyrics = drink_beer
            self.bottles -= 1
            return lyrics
        }
    }

    var buy_new_beer: String {
        return "Go to the store and buy some more"
    }

    var drink_beer: String {
        return "Take \(it_or_one) down and pass it around"
    }

    var it_or_one: String {
        return last_beer ? "it" : "one"
    }

    var all_out: Bool {
        return bottles == 0
    }

    var last_beer: Bool {
        return bottles == 1
    }
}

extension String {
    var capitalize: String {
        let range_of_first_char = startIndex..<index(after: startIndex)

        let range_excluding_first_char = index(after: startIndex)..<self.endIndex

        var remainingChars = self
        remainingChars.removeSubrange(range_of_first_char)

        var firstChar = self
        firstChar.removeSubrange(range_excluding_first_char)

        return firstChar.uppercased() + remainingChars
    }
}
