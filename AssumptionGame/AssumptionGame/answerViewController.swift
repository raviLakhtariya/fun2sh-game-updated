//
//  answerViewController.swift
//  AssumptionGame
//
//  Created by Nirav on 19/06/18.
//  Copyright © 2018 Elluminati. All rights reserved.
//

import UIKit
import AVFoundation

class answerViewController: UIViewController {
    var answerIs : Int!
    @IBOutlet weak var resultValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultValue.text = String(answerIs)
        let string = "Your answer is  \(resultValue.text)"
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
