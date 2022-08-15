//
//  WordGame.swift
//  BabbelTest
//
//  Created by Fredy Shaji on 2022-08-15.
//

import Foundation

struct WordGame: Decodable {

    var spanishText: String
    var englishText: String

    init(wordGame: WordGame) {
        spanishText = wordGame.spanishText 
        englishText = wordGame.englishText 
    }

    init(spanishText: String = "", englishText: String = "") {
        self.spanishText = spanishText
        self.englishText = englishText
    }

    enum CodingKeys: String, CodingKey {
        case spanishText = "text_spa"
        case englishText = "text_eng"
    }
}
