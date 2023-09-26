//
//  ViewController.swift
//  Spot-a-Knot
//
//  Created by Djordje Mihajlovic on 23/09/2023.
//

/*
 Things to do:
 Game
 Knot Collection
 Answer object
 Question object
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startGame() {
        
        let vc = storyboard?.instantiateViewController(identifier: "game") as! GameViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
    @IBAction func startCollection() {
        
        let lc = storyboard?.instantiateViewController(identifier: "collection") as! CollectionViewController
        lc.modalPresentationStyle = .fullScreen
        present(lc, animated: true)
        
    }
    


}

