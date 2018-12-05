//
//  GoalViewController.swift
//  DietDoctorC
//
//  Created by MURRO, JOHN REXES  on 05/12/2018.
//  Copyright © 2018 MURRO, JOHN REXES . All rights reserved.
//

import UIKit
import CoreData

class GoalViewController: UIViewController {

    @IBOutlet weak var myWeightGoal: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName:"User",in:context)
            let newGoal = NSManagedObject(entity: entity!,insertInto:context)
            newGoal.setValue(myWeightGoal.text, forKey: "weightGoal")
        do{
            try context.save()
        }catch{
            print("Failed saving")
        }
    }

}
