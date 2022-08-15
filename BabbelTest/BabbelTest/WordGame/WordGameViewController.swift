//
//  ViewController.swift
//  BabbelTest
//
//  Created by Fredy Shaji on 2022-08-15.
//

import UIKit

class WordGameViewController: UIViewController {

    @IBOutlet weak var correctAttemptsCountLabel: UILabel!
    @IBOutlet weak var wrongAttemptsCountLabel: UILabel!
    @IBOutlet weak var spanishWordLabel: UILabel!
    @IBOutlet weak var englishWordLabel: UILabel!
    @IBOutlet weak var correctChoiceButton: UIButton!
    @IBOutlet weak var incorrectChoiceButton: UIButton!

    var viewModel = WordGameViewModel()
    
    private let correctAttemptsTitle = "Correct attempts: "
    private let wrongAttemptsTitle = "Wrong attempts: "
    private let correctTitle = "Correct"
    private let wrongTitle = "Wrong"
    private var correctCount = 0
    private var incorrectCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
        viewModel.fetchData()
        loadQuestion()
    }

    func setUpUI() {
        updateScore()
        correctChoiceButton.titleLabel?.text = correctTitle
        incorrectChoiceButton.titleLabel?.text = wrongTitle
    }

    func loadQuestion() {
        let question = viewModel.loadQuestion()
        self.spanishWordLabel.text = question.spanishText
        self.englishWordLabel.text = question.englishText
    }

    func updateScore() {
        correctAttemptsCountLabel.text = correctAttemptsTitle + String(correctCount)
        wrongAttemptsCountLabel.text = wrongAttemptsTitle + String(incorrectCount)
        loadQuestion()
    }

    // MARK :- Button Ac tions
    
    @IBAction func correctButtonClicked(sender: UIButton) {
        print("button Clicked")
        let answer = viewModel.checkAnswer()
        answer ? (correctCount += 1) : (incorrectCount += 1)
        updateScore()
    }

    @IBAction func incorrectButtonClicked(sender: UIButton) {
        print("button Clicked")
        let answer = viewModel.checkAnswer()
        answer ? (incorrectCount += 1) : (correctCount += 1)
        updateScore()
    }
}

