//
//  WordGameViewModel.swift
//  BabbelTest
//
//  Created by Fredy Shaji on 2022-08-15.
//

import Foundation

final class WordGameViewModel {
    
    var wordsArray = [WordGame]()
    
    func fetchData() {
        if let path = Bundle.main.path(forResource: "words", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONDecoder().decode([WordGame].self, from: data)
                wordsArray = jsonResult
            } catch {
                print("Failed to decode json")
            }
        }
    }
}
