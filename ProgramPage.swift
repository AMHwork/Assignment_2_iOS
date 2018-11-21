//
//  ProgramPage.swift
//  Assignment_2
//
//  Created by Austin Hua on 19/1/18.
//  Copyright © 2018 Austin Hua. All rights reserved.
//

import UIKit

class ProgramPage: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let db = DatabaseManager()       // open up the database
    
    var pathName : String = String() // variable to save program name

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // function to count content in program database
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let viewContent : [String]
        viewContent = db.retrieveProgram()
        return viewContent.count
    }
    
    // display program data in a tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var viewContent : [String]
        viewContent = db.retrieveProgram()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "programCell", for: indexPath) as! programCell
        
        cell.programName.text = viewContent[indexPath.row]
        
        return cell

    }
    
    // save program name for next page (ShowProgram)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let viewController2 = segue.destination as? ShowProgram {
            viewController2.passedName = pathName
        }
        
        
    }

    // save the program name (onClick) and send info to next page
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var viewContent : [String]
        viewContent = db.retrieveProgram()
        
        pathName = viewContent[indexPath.row]
        
        let segueIdentifier: String
        segueIdentifier = "program"
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
        
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
