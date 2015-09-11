//
//  ParseCloudTesteViewController.swift
//  ParseSwiftTestes
//
//  Created by Ramon Honorio on 9/9/15.
//  Copyright (c) 2015 Ramon. All rights reserved.
//

import UIKit
import Parse

class ParseCloudTesteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func retornaJobsons(sender: AnyObject) {
        PFCloud.callFunctionInBackground("retornaJobsons", withParameters: ["teste":"teste"]) {
            (response, error) -> Void in
            
            if let error = error as NSError? {
                println("Errozito: \(error.description)")
            }
            
            if let resposta: AnyObject = response as AnyObject?{
                println("A função foi executada no Cloud *_*")
//                let obj = resposta[5].objectForKey("nome") as! String
                println("->>\(response)")
            }
//            var error = NSErrorPointer()
//            PFCloud.callFunction("retornaJobsons", withParameters: ["teste":"teste"], error: error)
//            
//            println("--> \(error.debugDescription)")
        }
    
        
    }
    
    @IBAction func insereJobson(sender: AnyObject) {
        let img1 = UIImage(named: "afrodev")
        let img2 = UIImage(named: "draw")
        
        let data1 = UIImagePNGRepresentation(img1)
        let data2 = UIImagePNGRepresentation(img2)
        
        let file1 = PFFile(data: data1)
        let file2 = PFFile(data: data2)
        
        let random = arc4random() % 1000
        
        var obj = PFUser()
        obj.username = "teste \(random)"
        obj.email = "email\(random)@teste.com"
        obj.password = "teste"
        obj["nome"] = "nome \(random)"
//        obj["portfolio"] = [file1, file2]
        
        obj.signUpInBackgroundWithBlock { (success, error) -> Void in
            if let success = success as Bool? {
                println("user salvo")
                PFUser.logOut()
            }
        }
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
