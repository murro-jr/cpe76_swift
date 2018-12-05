//
//  ViewController.swift
//  DietDoctorC
//
//  Created by MURRO, JOHN REXES  on 05/12/2018.
//  Copyright © 2018 MURRO, JOHN REXES . All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var myWeightGoal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"User")
        request.fetchLimit = 1
        
        do{
            let result = try context.fetch(request)
            let firstItem: User = result.first as! User
            myWeightGoal.text = firstItem.weightGoal
        }catch{
            print("Failed")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

