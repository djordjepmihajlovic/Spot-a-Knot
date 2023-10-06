//
//  CollectionViewController.swift
//  Spot-a-Knot
//
//  Created by Djordje Mihajlovic on 26/09/2023.
//

import UIKit

class CollectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var models = [Model]()
    
//    To do:
//      *Make each row different; different knot crossing per row
//      *Make 'unlockable'
//      *Make each image clickable --> opens the knot and gives 'stats'
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        models.append(Model(text: "unknot", imageName: "0_1"))
        models.append(Model(text: "trefoil", imageName: "3_1"))
        models.append(Model(text: "figure 8", imageName: "4_1"))
        models.append(Model(text: "pentafoil", imageName: "5_1"))
        
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        
        cell.configure(with: models)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    

}

struct Model {
    let text: String
    let imageName: String
    
    init(text: String, imageName: String){
        self.text = text
        self.imageName = imageName
    }
}
