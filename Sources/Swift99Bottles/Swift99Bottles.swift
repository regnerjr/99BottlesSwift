struct Swift99Bottles {
    func song() -> String {
      return verses(99, 0)
    }

    func verses(_ start: Int, _ end: Int) -> String {
      let rangeOfVerses = (end...start).reversed()
      return rangeOfVerses.map { verse($0)}.joined(separator:"\n")
    }

    func verse(_ n: Int) -> String {
      return
        "\(n == 0 ? "No more" : String(n)) bottle\(n == 1 ? "" : "s")" +
        " of beer on the wall, " +
        "\(n == 0 ? "no more" : String(n)) bottle\(n == 1 ? "" : "s") of beer.\n" +
        "\(n > 0 ? "Take \(n > 1 ? "one" : "it" ) down and pass it around" : "Go to the store and buy some more"), " +
        "\(((n - 1 < 0) ? "99" : ((n - 1 == 0) ? "no more" : String(n-1))) + " bottle\((n - 1 != 1) ? "s" : "")")" +
        " of beer on the wall.\n"
    }
}
