//
//  GameViewController.swift
//  Spot-a-Knot
//
//  Created by Djordje Mihajlovic on 24/09/2023.
//

import UIKit

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var gameModels = [Question]()
    
    var currentQuestion: Question?
    
    @IBOutlet var label: UILabel!
    @IBOutlet var table: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        setupQuestions()
        configureUI(question: gameModels.first!)
    }
    
    
    private func configureUI (question: Question) {
        label.text = question.text
        currentQuestion = question
        table.reloadData()

    }
    
    private func checkAnswer(answer: Answer, question: Question) -> Bool{
        return question.answers.contains(where: {$0.text == answer.text}) && answer.correct
        
    }
    
    private func setupQuestions() {
        gameModels.append(Question(text: "Unknot", answers: [
        Answer(text: "Trefoil", correct: false),
        Answer(text: "Unknot", correct: true),
        Answer(text: "Pentafoil", correct: false),
        Answer(text: "Figure 8", correct: false)]))
        
    
        gameModels.append(Question(text: "Trefoil", answers: [
        Answer(text: "Pentafoil", correct: false),
        Answer(text: "Figure 8", correct: false),
        Answer(text: "Unknot", correct: false),
        Answer(text: "Trefoil", correct: true)]))
        
    
        gameModels.append(Question(text: "Figure 8", answers: [
        Answer(text: "Figure 8", correct: true),
        Answer(text: "Pentafoil", correct: false),
        Answer(text: "Unknot", correct: false),
        Answer(text: "Trefoil", correct: false)]))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currentQuestion?.answers[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let question = currentQuestion else {
            return
        }
        
        let answer = question.answers[indexPath.row]
        
        if checkAnswer(answer: answer, question: question) {
            if let index = gameModels.firstIndex(where: { $0.text == question.text }) {
                if index < (gameModels.count - 1) {
                    //next question
                    let nextQuestion = gameModels[index+1]
                    currentQuestion = nil
                    configureUI(question: nextQuestion)
                }
                else {
                    let alert = UIAlertController(title: "Congratulations", message: "You've spotted all the knots!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    present(alert, animated: true)
                    
                }
            }
        }
        else {
            let alert = UIAlertController(title: "Wrong", message: "The knot you've chosen was incorrect!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }
    
}

struct Question {
    let text: String
    let answers: [Answer]
}

struct Answer {
    let text: String
    let correct: Bool
}
