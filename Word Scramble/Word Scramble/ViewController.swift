//
//  ViewController.swift
//  Word Scramble
//
//  Created by Ivayla  Panayotova on 12.07.23.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(startGame))
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startWordsURL){
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        if allWords.isEmpty{
            allWords = ["bookwarm"]
        }
        
        startGame()
    }
    
    @objc func startGame(){
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
            cell.textLabel?.text = usedWords[indexPath.row]
            return cell
    }
    
    @objc func promptForAnswer(){
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default){
            [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else{ return }
            self?.submit(answer)
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ answer: String){
        /*
        let errorTitle: String
        let errorMessage: String
         */
        let word = answer.lowercased()
        if word == ""{
            showErrorMessage(errorTitle: "Blank space", errorMessage: "You shouldn't enter blank space")
        }
        else if word.count < 3{
            showErrorMessage(errorTitle: "Too short", errorMessage: "Your word should be at least 3 charecters")
        }
        else if word == title{
            showErrorMessage(errorTitle: "Different word", errorMessage: "Your should write different than the starting word")
        }
        else{
            if isPossible(word) {
                if isReal(word) {
                    if isOriginal(word){
                        usedWords.insert(answer.lowercased(), at: 0)
                        let indexPath = IndexPath(row: 0, section: 0)
                        tableView.insertRows(at: [indexPath], with: .automatic)
                        return
                    } else {
                        showErrorMessage(errorTitle: "Not original word", errorMessage: "You already entered that word")
                    }
                } else {
                    showErrorMessage(errorTitle: "Not real word", errorMessage: "There is no such a word")
                }
            } else {
                showErrorMessage(errorTitle: "Not possible word", errorMessage: "The word has other letters")
            }
        }
        /*
        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
         */
    }
    
    func isPossible(_ word: String) -> Bool{
        guard var tmpWord = title?.lowercased() else {return false}
        for letter in word {
            if let position = tmpWord.firstIndex(of: letter){
                tmpWord.remove(at: position)
            }
            else{
                return false
            }
        }
        return true
    }
    func isOriginal(_ word: String) -> Bool{
        return !usedWords.contains(word)
    }
    func isReal(_ word: String) -> Bool{
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func showErrorMessage(errorTitle: String, errorMessage: String){
        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }


}

