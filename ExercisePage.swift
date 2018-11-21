//
//  ExercisePage.swift
//  Assignment_2
//
//  Created by Austin Hua on 19/1/18.
//  Copyright © 2018 Austin Hua. All rights reserved.
//

import UIKit

class ExercisePage: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let db = DatabaseManager()        // open up the database
    
    var pathName : String = String()  // variable to save category name

       override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // function to count content array
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let viewContent : [String]
        viewContent = db.retrieveCategory()
        return viewContent.count
    }
    
    
    // display content in a tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var viewContent : [String]
        viewContent = db.retrieveCategory()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! categoryCellTableViewCell
        
        // display image and text for back
        if (viewContent[indexPath.row] == "back"){
            cell.categoryLabel.text = viewContent[indexPath.row]
            cell.categoryImage.image = UIImage (named: "back")!
        }
        // display image and text for biceps
        else if (viewContent[indexPath.row] == "biceps"){
            cell.categoryLabel.text = viewContent[indexPath.row]
            cell.categoryImage.image = UIImage (named: "biceps")!
        }
        // display image and text for calf
        else if (viewContent[indexPath.row] == "calf"){
            cell.categoryLabel.text = viewContent[indexPath.row]
            cell.categoryImage.image = UIImage (named: "calf")!
        }
        // display image and text for chest
        else if (viewContent[indexPath.row] == "chest"){
            cell.categoryLabel.text = viewContent[indexPath.row]
            cell.categoryImage.image = UIImage (named: "chest")!
        }
        // display image and text for glutes
        else if (viewContent[indexPath.row] == "glutes"){
            cell.categoryLabel.text = viewContent[indexPath.row]
            cell.categoryImage.image = UIImage (named: "glutes")!
        }
        // display image and text for shoulders
        else if (viewContent[indexPath.row] == "shoulders"){
            cell.categoryLabel.text = viewContent[indexPath.row]
            cell.categoryImage.image = UIImage (named: "shoulders")!
        }
        // display image and text for thighs
        else if (viewContent[indexPath.row] == "thighs"){
            cell.categoryLabel.text = viewContent[indexPath.row]
            cell.categoryImage.image = UIImage (named: "thighs")!
        }
        // display image and text for triceps
        else if (viewContent[indexPath.row] == "triceps"){
            cell.categoryLabel.text = viewContent[indexPath.row]
            cell.categoryImage.image = UIImage (named: "triceps")!
        }
        // display image and text for new/custom categories
        else {
            cell.categoryLabel.text = viewContent[indexPath.row]
            cell.categoryImage.image = UIImage (named: "custom")!
        }
 

        return cell;

    }
    
    
    // sends over the category name to the new viewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if let viewController2 = segue.destination as? ShowExercises {
            viewController2.passedValue = pathName
        }
    }
    
    // save the category(onclick) for the new viewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var viewContent : [String]
        viewContent = db.retrieveCategory()
        
        pathName = viewContent[indexPath.row]
        
        let segueIdentifier: String
        segueIdentifier = "exercise"
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
        
    }
 

    
    
    
    
    

  
}
