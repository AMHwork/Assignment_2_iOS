//
//  ShowExercises.swift
//  Assignment_2
//
//  Created by Austin Hua on 24/1/18.
//  Copyright © 2018 Austin Hua. All rights reserved.
//

import UIKit

class ShowExercises: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    let db = DatabaseManager()  // open up the database
    
    var passedValue : String?   // saved value of category name
    
    var viewContent : [String]? // array to store content

    override func viewDidLoad() {
        super.viewDidLoad()
        viewContent = db.retrieveExercise(name: passedValue!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // function to save the category name to the next page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let viewController2 = segue.destination as? AddExercisePage {
            viewController2.passedValueCategory = passedValue!
        }
        
    }

    // count each valye in the viewContent array
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewContent!.count
    }
    
    // display content in a table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath) as! ExerciseCell
        
        cell.exerciseName.text = viewContent![indexPath.row]
        
        return cell;
        
    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
