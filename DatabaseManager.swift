//
//  DatabaseManager.swift
//  Assignment_2
//
//  Created by Austin Hua on 26/1/18.
//  Copyright © 2018 Austin Hua. All rights reserved.
//

import UIKit
import CoreData

class DatabaseManager: NSObject {
    var category: [NSManagedObject] = [] // array to keep all data for category
    var exercise: [NSManagedObject] = [] // array to keep all data for exercise
    var program: [NSManagedObject] = []  // array to keep all data for program
    var programList: [NSManagedObject] = [] // // array to keep all data from program(with exercises)
    var workouts: [NSManagedObject] = []  // array to keep all data for workouts
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // function to add a new category
    func addcategory(image:String, name:String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Category", in: managedContext)
        let product = NSManagedObject(entity: entity!, insertInto: managedContext)
        product.setValue(image, forKey: "categoryImage")
        product.setValue(name, forKey: "categoryName")
        do {
            try managedContext.save()
            category.append(product)
        }
            
        catch let error as NSError {
            print(error)
        }
        
        
    }
    
    // function to retrieve category
    func retrieveCategory() -> [String] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return [""]}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Category")
        do {
            category = try managedContext.fetch(fetchRequest)
        }
            
        catch let error as NSError {
            print(error)
        }
        
        var msg : [String] = []
        
        for product in category {
            msg.append((product.value(forKeyPath: "categoryImage") as? String)!)
            msg.append((product.value(forKeyPath: "categoryName") as? String)!)
        }
      
        msg = Array(Set(msg)) // ensure that all duplicates are removed
        return msg
        
    }
    
    // function to add a new exercise
    func addExercise(catName:String, exName:String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Exercises", in: managedContext)
        let product = NSManagedObject(entity: entity!, insertInto: managedContext)
        product.setValue(catName, forKey: "categoryName")
        product.setValue(exName, forKey: "exerciseName")
        do {
            try managedContext.save()
            exercise.append(product)
        }
            
        catch let error as NSError {
            print(error)
        }
        
        
    }
    
    // function to retrieve all exercises (with category name)
    func retrieveExercise(name: String) -> ([String]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return ([""])}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Exercises")
        fetchRequest.predicate = NSPredicate(format: "categoryName == %@", name)
        do {
            exercise = try managedContext.fetch(fetchRequest)
        }
            
        catch let error as NSError {
            print(error)
        }
        
        var msg2 : [String] = []
        
        for product in exercise {
            msg2.append((product.value(forKeyPath: "exerciseName") as? String)!)
        }
        
        return msg2
        
    }
    
    // function to retrieve all exercises (without category name)
    func retrieveAllExercise() -> ([String]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return ([""])}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Exercises")
        do {
            exercise = try managedContext.fetch(fetchRequest)
        }
            
        catch let error as NSError {
            print(error)
        }
        
        var msg2 : [String] = []
        
        for product in exercise {
            msg2.append((product.value(forKeyPath: "exerciseName") as? String)!)
        }
        
        return msg2
        
    }

    // function to add a new program
    func addProgram(name:String, day:String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Program", in: managedContext)
        let product = NSManagedObject(entity: entity!, insertInto: managedContext)
        product.setValue(name, forKey: "programName")
        product.setValue(day, forKey: "programDay")
        do {
            try managedContext.save()
            program.append(product)
        }
            
        catch let error as NSError {
            print(error)
        }
        
    }
    
    // function to retrieve program
    func retrieveProgram() -> [String] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return [""]}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Program")
        do {
            program = try managedContext.fetch(fetchRequest)
        }
            
        catch let error as NSError {
            print(error)
        }
        
        var msg : [String] = []
        var string1 : String = ""
        var string2 : String = ""
        
        for product in program {
            
            string1 = product.value(forKey: "programName")! as! String
            
            string2 = product.value(forKey: "programDay")! as! String
            
            msg.append(string1 + " --- " + string2)
        }
        return msg
        
    }
    
    // function to add a new program with exercises
    func addProgramList(name:String, exercise:String ){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ProgramList", in: managedContext)
        let product = NSManagedObject(entity: entity!, insertInto: managedContext)
        product.setValue(name, forKey: "programName")
        product.setValue(exercise, forKey: "exerciseName")
        do {
            try managedContext.save()
            programList.append(product)
        }
            
        catch let error as NSError {
            print(error)
        }
        
    }
    
    // function to retrieve program with exercises
    func retrieveProgramList(name: String) -> ([String]){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return ([""])}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ProgramList")
        fetchRequest.predicate = NSPredicate(format: "programName == %@ ", name)
        do {
            programList = try managedContext.fetch(fetchRequest)
        }
            
        catch let error as NSError {
            print(error)
        }
        
        var msg2 : [String] = []
        
        for product in programList {
            msg2.append((product.value(forKeyPath: "exerciseName") as? String)!)
        }
        
        return msg2
        
    }
    
    // function to save workout
    func addWorkout(program:String, exercise:String, set:String, rep:String, weight:String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Workouts", in: managedContext)
        let product = NSManagedObject(entity: entity!, insertInto: managedContext)
        product.setValue(program, forKey: "program")
        product.setValue(exercise, forKey: "exercise")
        product.setValue(rep, forKey: "rep")
        product.setValue(set, forKey: "set")
        product.setValue(weight, forKey: "weights")
        do {
            try managedContext.save()
            workouts.append(product)
        }
            
        catch let error as NSError {
            print(error)
        }
        
        
    }
    
    // function to retrieve all workouts done
    func retrieveWorkout() -> [String] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return [""]}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Workouts")
        do {
            workouts = try managedContext.fetch(fetchRequest)
        }
            
        catch let error as NSError {
            
            print(error)
        }
        
        var msg : [String] = []
        var string1 : String = ""
        var string2 : String = ""
        var string3 : String = ""
        var string4 : String = ""
        var string5 : String = ""
       
        
        for product in workouts {
            
            string1 = product.value(forKey: "program")! as! String
            
            string2 = product.value(forKey: "exercise")! as! String
            
            string3 = product.value(forKey: "rep")! as! String
            
            string4 = product.value(forKey: "set")! as! String
            
            string5 = product.value(forKey: "weights")! as! String
            
            msg.append(string1 + "\n" + string2 + "\n" + string3 + "x" + string4 + "x" + string5 + "\n\n")
            
        }
        
        return msg
        
    }


}
