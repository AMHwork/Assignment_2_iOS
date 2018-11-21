//
//  AddCategoryPage.swift
//  Assignment_2
//
//  Created by Austin Hua on 23/1/18.
//  Copyright © 2018 Austin Hua. All rights reserved.
//

import UIKit

class AddCategoryPage: UIViewController {

    @IBOutlet weak var categoryName: UITextField! // label for category
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // function to add a new category with category name and category Image
    @IBAction func add(_ sender: Any) {
        
        let db = DatabaseManager()
        
        let name = categoryName.text!
        let image = "custom"
        
        let alertController = UIAlertController(title: "Alert", message: "Successfully Added!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Done!", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
        
        db.addcategory(image: image , name: name)
        
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
