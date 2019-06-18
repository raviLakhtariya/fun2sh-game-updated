//
//  homeViewController.swift
//  AssumptionGame
//
//  Created by Nirav on 19/06/18.
//  Copyright © 2018 Elluminati. All rights reserved.
//

import UIKit
import AVFoundation
class homeViewController: UIViewController {

    @IBOutlet weak var lblStep: UILabel!
    @IBOutlet weak var NextBtn: UIButton!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var valuAdder: UILabel!
    
    @IBOutlet weak var lblSubDesc: UILabel!
    
    var customview = UIView()
    var array = [Int]()
    var valueBool : Bool? = false
    var valueInt : Int = 0
    
    
    @IBOutlet weak var timerLabel: UILabel!
    var timer = Timer()
    var seconds = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
     self.Initialization()
        NextBtn.addTarget(self, action: #selector(nextButtonTap(sender:)), for: .touchUpInside)
        self.timerLabel.text = "Count-Down"
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func Initialization(){
        self.valueInt = 0
        lblStep.text = "Step 1"
        lblStep.textAlignment = .center
        lblDesc.text = "Choose one number";
        lblSubDesc.text = "EXAMPLE \n\n choose any number between 1 to 1000 \n"
        valuAdder.isHidden = true
        
    }
    
    func checkValue(){
        if valueInt == 0 {
            self.Initialization()
            
        }else if valueInt == 1{
            self.valueInt = 1
           
            lblStep.text = "Step 2"
            lblStep.textAlignment = .center
            lblDesc.text = "Make Double your number "
            lblSubDesc.text = "EXAMPLE \n\n suppose i chooose X then it double X * 2 = Z \n"
       
            valuAdder.isHidden = true
            
        }else if valueInt == 2 {
           // self.valueInt = 2
            lblStep.text = "Step 3"
            lblStep.textAlignment = .center
            lblDesc.text = "Add number show in below last"
            lblSubDesc.text = "EXAMPLE \n\n  suppose after step 2 your answer is X then add below box value Y means X + Y = Z  \n"
            
            valuAdder.isHidden = false
            for i in 1...1000  {
                if i % 2 == 0 {
                    array.append(i)
                    
                }
                
            }
            print(array)
            
            valuAdder.text = String(array[Int(arc4random_uniform(UInt32(array.count)))])//String(randomInt(min: 2, max: 100%2))
            
        }else if valueInt == 3 {
           // self.valueInt = 3
            lblStep.text = "Step 4"
            lblStep.textAlignment = .center
            lblDesc.text = "Now make half it"
            lblSubDesc.text = "EXAMPLE \n\n suppose after step 3 your answer is X then dovide by 2.   X / Y = Z \n"
            valuAdder.isHidden = true
            array.removeAll()
        }
        else if valueInt == 4 {
          //  self.valueInt = 4
            lblStep.text = "Step 5"
            lblStep.textAlignment = .center
            lblDesc.text = "now subtract your number what you choose from the answer . "
            lblSubDesc.text = "EXAMPLE \n\n suppose in step one you assume number X and your answr is Y then  Y - X = Z \n \n"
            valuAdder.isHidden = true
        }
        else{
           // self.valueInt = 0
          /*  lblStep.text = "Step 1"
            lblStep.textAlignment = .center
            lblDesc.text = "Choose one number  choose any number between 1 to 1000 \n"
            lblSubDesc.text = "EXAMPLE \n choose any number between 1 to 1000 \n"
            valuAdder.isHidden = true*/
        }
    }
    
    @objc func nextButtonTap(sender:UIButton){
        if valueInt == 0 {
            self.valueInt = 1
            NextBtn.isHidden = true
            self.checkValue()
            self.callMethod()
        }
        else if valueInt == 1 {
            
            self.valueInt = 2
            NextBtn.isHidden = true
            self.checkValue()
            self.callMethod()
        }
        else if valueInt == 2 {
            
            self.valueInt = 3
            NextBtn.isHidden = true
            self.checkValue()
            self.callMethod()
        }
        else if valueInt == 3 {
            
            self.valueInt = 4
            NextBtn.isHidden = true
            self.checkValue()
            self.callMethod()
        }
        else if valueInt == 4 {
//            self.valueInt = 5
//            NextBtn.isHidden = true
//            self.checkValue()
//            self.callMethod()
            
            let ansVC: answerViewController = self.storyboard?.instantiateViewController(withIdentifier: "result")as! answerViewController
            ansVC.answerIs = Int(Int(valuAdder.text!)! / 2)
            self.navigationController?.pushViewController(ansVC, animated: true)
        }
     /*   else if valueInt == 5 {
            
        }*/
        
    }
    func callMethod(){
        self.timerLabel.text = "10"
        self.timerLabel.textColor = UIColor.black
        self.runTimer()
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(homeViewController.updateTimer)), userInfo: nil, repeats: true)
     
    
    }
    @objc func timeeString(time : TimeInterval)->String{
        return String(Int(time) % 60)
    }
    
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
     
        timerLabel.text = timeeString(time: TimeInterval(seconds))
        if seconds <= 3 && seconds > 0{
        
            self.textToSpeech(times: String(seconds))
            timerLabel.textColor = UIColor.red
        }
        else{
            timerLabel.textColor = UIColor.black
        }
       
        if seconds == 0 {
        
           timer.invalidate()
            seconds = 10
            self.NextBtn.isHidden = false
            
        }
      
        //This will update the label.
    }
  
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    func textToSpeech(times:String){
        let string = times
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }

    
    func animation(){
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
          
            self.lblDesc.textColor = .blue
            
        },completion: { finish in
            
            UIView.animate(withDuration: 1, delay: 0.25,options: UIViewAnimationOptions.curveEaseOut,animations: {
                self.lblDesc.textColor = .orange
   
            },completion: nil)})

    }
}
