//
//  startWorkout.swift
//  Assignment_2
//
//  Created by Austin Hua on 28/1/18.
//  Copyright © 2018 Austin Hua. All rights reserved.
//

import UIKit

class startWorkout: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var workoutName: UILabel!
    @IBOutlet weak var setPicker: UIPickerView!
    @IBOutlet weak var repPicker: UIPickerView!
    @IBOutlet weak var weightPicker: UIPickerView!
    
    var passedValueName : String?      // program name
    var passedValueExercise : String?  // exercise name
    var pickerContent1 : String = ""   // number of sets
    var pickerContent2 : String = ""   // number of reps
    var pickerContent3 : String = ""   // weight number
    
    // arrays to store sets reps and weight
    var sets = [String]()
    var reps = [String]()
    var weights = [String]()
    
    // return one of each value
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // return the arrays stored for sets, reps and weight
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1){
            return sets[row]
        }
        else if (pickerView.tag == 2){
            return reps[row]
        }
        else {
            return weights[row]
        }

    }
    
    // counts number of lines for picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1){
            return sets.count
        }
        else if (pickerView.tag == 2){
            return reps.count
        }
        else {
            return weights.count
        }
    }
    
    // once a value is chosen, save the value into a string
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 1){
            pickerContent1 = sets[row]
        }
        else if (pickerView.tag == 2){
            pickerContent2 = reps[row]
        }
        else {
            pickerContent3 = weights[row]
        }
    }
    
    // add all the values in the viewDidLoad function
    override func viewDidLoad() {
        super.viewDidLoad()
        workoutName.text = passedValueExercise
        
        sets = ["1","2","3","4","5","6","7", "8","9","10","11","12","13","14","15","16","17","18","19","20"]
        
        reps = ["1","2","3","4","5","6","7", "8","9","10","11","12","13","14","15","16","17","18","19","20"]
        
        weights = ["0","5","10","15","20","25","30","35", "40","45","50","55","60","65","70","75","80","85","90","95","100"]
        // Do any additional setup after loading the view.
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // once workout has started, send the information to the workout page (TimerPage)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let viewController2 = segue.destination as? SelectExercise {
            viewController2.passedName = passedValueName!
        }
        
        if let viewController3 = segue.destination as? TimerPage {
            viewController3.passedProgramName = passedValueName!
            viewController3.passedExerciseName = passedValueExercise!
            viewController3.passedsetName = pickerContent1
            viewController3.passedrepName = pickerContent2
            viewController3.passedweightName = pickerContent3
        }
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
