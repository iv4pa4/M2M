//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Ivayla  Panayotova on 10.07.23.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    @IBOutlet var scoreButton: UIButton!
    
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var howManyDisplayedQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("us")
        countries.append("uk")
        
        button1.layer.borderWidth = 0.5
        button2.layer.borderWidth = 0.5
        button3.layer.borderWidth = 0.5
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestions()

    }
    
    func askQuestions(action: UIAlertAction! = nil){
        correctAnswer = Int.random(in: 0...2)
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        var str: String?
        str = countries[correctAnswer].uppercased()
        title = str;
        /*
         let scoreText = UITextView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        scoreText.text = String(score)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: scoreText)
        self.navigationItem.title = str
         */
        
        if howManyDisplayedQuestions >= 10 {
            displayed10Questions()
        }
        howManyDisplayedQuestions += 1
    }
    

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if(sender.tag == correctAnswer){
            title = "Correct !"
            score += 1
            alertMessage(title: title, message: "Your score is \(score)")
        }
        else{
            title = "Wrong !"
            score -= 1
            alertMessage(title: title, message: """
The correct flag was \(correctAnswer + 1)
Your score is \(score)
"""
            )
        }
    }
    
    
    @IBAction func scoreButtonTapped(_ sender: UIButton) {
        
    }
    
    func alertMessage(title: String, message: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestions))
        present(ac, animated: true)
    }
    
    func displayed10Questions(){
        let ac = UIAlertController(title: title, message: "You have answered 10 questions", preferredStyle: .alert)
        present(ac, animated: true)
    }
    
    
}

