//
//  TimerPage.swift
//  Assignment_2
//
//  Created by Austin Hua on 28/1/18.
//  Copyright © 2018 Austin Hua. All rights reserved.
//

import UIKit

class TimerPage: UIViewController {
    
    // open up the database
    let db = DatabaseManager()

    // labels for the following UI
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var setLabel: UILabel!
    @IBOutlet weak var repLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var seconds = 60      // how long each work out is
    var timer = Timer()   // set variable for timer function
    var running = false   // checks to see if timer is running
    var resume = false    // checks when timer is paused
    
    // strings to obtaining information from previous page (startWorkout)
    var passedProgramName : String?
    var passedExerciseName : String?
    var passedsetName : String?
    var passedrepName : String?
    var passedweightName : String?

    
    // display the following infomation to the UI
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workoutLabel.text = passedExerciseName!
        setLabel.text = passedsetName!
        repLabel.text = passedrepName!
        weightLabel.text = passedweightName!
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // start time once start button is pressed
    @IBAction func start(_ sender: Any) {
        if running == false {
            runTimer()
        }
        
    }
    
    // function to determine how the timer will run
    func runTimer (){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TimerPage.updateTimer)), userInfo: nil, repeats: true)
        
         running = true
    }
    
    // function to determine how to update Timer
    func updateTimer() {
        seconds -= 1
        timerLabel.text = timerString(time: TimeInterval(seconds))
    }

    // function to pause the timer (rest)
    @IBAction func rest(_ sender: Any) {
        if (self.resume == false) {
            timer.invalidate()
            self.running = true
        }
        else {
            runTimer()
            self.running = false
        }
    }
    
    // function to reset the timer
    @IBAction func reset(_ sender: Any) {
        timer.invalidate()
        seconds = 60
        timerLabel.text = timerString(time: TimeInterval(seconds))
        running = false
       
    }
    
    // string to display what the timer looks like
    func timerString (time: TimeInterval) -> String {
        let seconds = Int(time) % 60
        return String (format: "%02i", seconds)
    }
    
    // function to save workout once done
    @IBAction func save(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Alert", message: "Successfully Saved!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Done!", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)

        
        db.addWorkout(program: passedProgramName!, exercise: passedExerciseName!, set: passedsetName!, rep: passedrepName!, weight: passedweightName!)
        
    }
    
    // function to keep program name when going back to exercises
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let viewController2 = segue.destination as? SelectExercise {
            viewController2.passedName = passedProgramName!
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
