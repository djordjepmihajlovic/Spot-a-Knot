//
//  CollectionViewController.swift
//  Spot-a-Knot
//
//  Created by Djordje Mihajlovic on 26/09/2023.
//

import UIKit

class CollectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var models = [Family]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//-------------------------------------------------------------------------------
        
//        Knot families 0 - 5
        models.append(Family(family:[Model(text: "Unknot", imageName: UIImage(named:"0_1")), Model(text: "Trefoil", imageName: UIImage(named:"3_1")), Model(text: "Figure 8", imageName: UIImage(named:"4_1")), Model(text: "Pentafoil", imageName: UIImage(named:"5_1")), Model(text: "3 twist", imageName: UIImage(named: "5_2"))]))
        
//        Knot families 6
        models.append(Family(family:[Model(text: "Stevedore's knot", imageName: UIImage(named:"6_1")), Model(text: "Miller Institute knot", imageName: UIImage(named:"6_2")), Model(text: "1/4 Irish knot", imageName: UIImage(named:"6_3"))]))
        
//        Knot families 7
        models.append(Family(family:[Model(text: "Septafoil", imageName: UIImage(named:"7_1")), Model(text: "7_2", imageName: UIImage(named:"7_2")), Model(text: "7_3", imageName: UIImage(named:"7_3")), Model(text: "7_4", imageName: UIImage(named:"7_4")), Model(text: "7_5", imageName: UIImage(named:"7_5")), Model(text: "7_6", imageName: UIImage(named:"7_6")), Model(text: "7_7", imageName: UIImage(named:"7_7"))]))
        
//        Knot families 8
//        Knot families 9
//        Knot families 10
        
        models.append(Family(family:[Model(text: "10_91", imageName: UIImage(named:"10_91")), Model(text: "10_117", imageName: UIImage(named:"10_117")), Model(text: "10_146", imageName: UIImage(named:"10_146")), Model(text: "10_147", imageName: UIImage(named:"10_147"))]))
        
//--------------------------------------------------------------------------
        
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count 
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
//
//        cell.configure(with: models)
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell

        let familyForRow = models[indexPath.row]
        cell.configure(with: familyForRow.family)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    

}

struct Family {
    let family: [Model]
}

struct Model {
    let text: String
    let imageName: UIImage?
    
//    init(text: String, imageName: String){
//        self.text = text
//        self.imageName = imageName
//    }
}
