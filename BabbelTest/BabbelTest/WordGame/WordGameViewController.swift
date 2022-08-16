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
    @IBOutlet weak var spanishLabelCenterYConstraint: NSLayoutConstraint!
    
    var viewModel = WordGameViewModel()
    var timer = Timer()
    
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

        correctChoiceButton.setTitle(correctTitle, for: .normal)
        correctChoiceButton.setTitle(correctTitle, for: .selected)
        incorrectChoiceButton.setTitle(wrongTitle, for: .normal)
        incorrectChoiceButton.setTitle(wrongTitle, for: .selected)
        correctChoiceButton.layer.cornerRadius = 20
        incorrectChoiceButton.layer.cornerRadius = 20
    }

    func loadQuestion() {
        timer.invalidate()
        spanishLabelCenterYConstraint.constant = -(self.view.frame.height / 2)
        view.layoutIfNeeded()
        let question = viewModel.loadQuestion()
        spanishWordLabel.text = question.spanishText
        englishWordLabel.text = question.englishText
        startTimer()
        UIView.animate(withDuration: 5, delay: 0, options: [.transitionFlipFromTop],
                       animations: {
            self.spanishLabelCenterYConstraint.constant = ((self.view.frame.height / 2) + self.spanishWordLabel.frame.height)
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    func updateScore() {
        correctAttemptsCountLabel.text = correctAttemptsTitle + String(correctCount)
        wrongAttemptsCountLabel.text = wrongAttemptsTitle + String(incorrectCount)
        if viewModel.questionCount >= 15 || incorrectCount >= 3 {
            exit(0)
        } else {
            loadQuestion()
        }
    }

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }

    // MARK :- Actions
    
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

    @objc func timerAction() {
        incorrectCount += 1
        updateScore()
    }
}

