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
    
    let correctAttemptsTitle = "Correct attempts: "
    let wrongAttemptsTitle = "Wrong attempts: "
    let correctTitle = "Correct"
    let wrongTitle = "Wrong"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
        viewModel.fetchData()
    }

    func setUpUI() {
        correctAttemptsCountLabel.text = correctAttemptsTitle + "0"
        wrongAttemptsCountLabel.text = wrongAttemptsTitle + "0"
        correctChoiceButton.titleLabel?.text = correctTitle
        incorrectChoiceButton.titleLabel?.text = wrongTitle
    }

}

