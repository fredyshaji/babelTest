//
//  WordGameViewModel.swift
//  BabbelTest
//
//  Created by Fredy Shaji on 2022-08-15.
//

import Foundation

final class WordGameViewModel {
    
    var wordsArray = [WordGame]()
    var questionCount = 0.0
    var correctPairCount = 0.0
    var truePercent = 0.0
    var currentQuestion = WordGame()
    var wordsDict = [String:String]()
    
    func fetchData() {
        if let path = Bundle.main.path(forResource: "words", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONDecoder().decode([WordGame].self, from: data)
                wordsArray = jsonResult
                wordsDict = wordsArray.reduce([String:String]()) { (result, word) -> [String:String] in
                    var result = result
                    result[word.englishText] = word.spanishText
                    return result
                }
            } catch {
                print("Failed to decode json")
            }
        }
    }

    func loadQuestion() -> WordGame {
        currentQuestion = WordGame()
        if truePercent > 25 || questionCount < 2 {
            guard let questionOne = wordsArray.randomElement(),
                  let questionTwo = wordsArray.randomElement(),
                  let questionThree = wordsArray.randomElement(),
                  let questionFour = wordsArray.randomElement()
            else { return currentQuestion }
            
            currentQuestion.englishText = ([questionOne.englishText , questionTwo.englishText, questionThree.englishText , questionFour.englishText].randomElement()) ?? ""
            currentQuestion.spanishText = ([questionOne.spanishText, questionTwo.spanishText, questionThree.spanishText, questionFour.spanishText].randomElement()) ?? ""
            return currentQuestion
        } else {
            let correctWord = wordsArray.randomElement()
            currentQuestion.englishText = correctWord?.englishText ?? ""
            currentQuestion.spanishText = correctWord?.spanishText ?? ""
            return currentQuestion
        }
    }

    func checkAnswer() -> Bool {
        let correctTranslation = wordsDict[currentQuestion.englishText] == currentQuestion.spanishText ? true : false
        if correctTranslation {
            correctPairCount += 1
        }
        questionCount += 1
        updateTruePercent()
        return correctTranslation
    }

    func updateTruePercent() {
        truePercent = (correctPairCount/questionCount) * 100
    }
}
