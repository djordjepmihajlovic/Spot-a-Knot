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
    @IBOutlet var image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        setupQuestions()
        configureUI(question: gameModels.first!)
    }
    
    
    private func configureUI (question: Question) {
        label.text = question.text
        image.image = question.img
        currentQuestion = question
        table.reloadData()

    }
    
    private func checkAnswer(answer: Answer, question: Question) -> Bool{
        return question.answers.contains(where: {$0.text == answer.text}) && answer.correct
        
    }
    
    private func setupQuestions() {
        gameModels.append(Question(img: UIImage(named:"0_1"), text: "Unknot", answers: [
            Answer(img: UIImage(named:"3_1"), text: "Trefoil", correct: false),
            Answer(img: UIImage(named:"0_1"), text: "Unknot", correct: true),
            Answer(img: UIImage(named:"4_1"), text: "Pentafoil", correct: false),
            Answer(img: UIImage(named:"5_1"), text: "Figure 8", correct: false)]))
        
    
        gameModels.append(Question(img: UIImage(named:"3_1"), text: "Trefoil", answers: [
            Answer(img: UIImage(named:"5_1"), text: "Pentafoil", correct: false),
            Answer(img: UIImage(named:"4_1"), text: "Figure 8", correct: false),
            Answer(img: UIImage(named:"0_1"), text: "Unknot", correct: false),
            Answer(img: UIImage(named:"3_1"), text: "Trefoil", correct: true)]))
        
    
        gameModels.append(Question(img: UIImage(named:"4_1"), text: "Figure 8", answers: [
            Answer(img: UIImage(named:"4_1"), text: "Figure 8", correct: true),
            Answer(img: UIImage(named:"5_1"), text: "Pentafoil", correct: false),
            Answer(img: UIImage(named:"0_1"), text: "Unknot", correct: false),
            Answer(img: UIImage(named:"3_1"), text: "Trefoil", correct: false)]))
        
        gameModels.append(Question(img: UIImage(named:"10_146"), text: "10_146", answers: [
            Answer(img: UIImage(named:"10_117"), text: "10_117", correct: false),
            Answer(img: UIImage(named:"10_147"), text: "10_147", correct: false),
            Answer(img: UIImage(named:"10_91"), text: "10_91", correct: false),
            Answer(img: UIImage(named:"10_146"), text: "10_146", correct: true)]))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currentQuestion?.answers[indexPath.row].text
        cell.imageView?.image = currentQuestion?.answers[indexPath.row].img
        
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
    let img:UIImage?
    let text: String
    let answers: [Answer]
}

struct Answer {
    let img: UIImage?
    let text: String
    let correct: Bool
}
