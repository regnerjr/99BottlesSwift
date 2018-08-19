//
//  String+Extensions.swift
//  Swift99Bottles
//
//  Created by John Regner on 8/13/18.
//

import Foundation

extension String {
  func capitalize() -> String {
    let firstChar = prefix(1).uppercased()
    let lastChars = dropFirst(1)
    return String(firstChar + lastChars)
  }
}
