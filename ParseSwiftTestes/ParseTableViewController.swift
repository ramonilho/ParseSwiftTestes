//
//  ParseTableViewController.swift
//  ParseSwiftTestes
//
//  Created by Ramon Honorio on 5/24/15.
//  Copyright (c) 2015 Ramon. All rights reserved.
//

import UIKit
import Parse

class ParseTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Teste de insercao
        var perfil = PFObject(className: "perfil")
        perfil["nome"] = "-- Insercao via codigo --"
        perfil["email"] = "code@email.com"
        perfil["senha"] = "1234"
        perfil.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if(success) {
                // O objeto foi salvo
                println("OK, perfil salvo")
            } else {
                // Ocorreu algum erro
                println("[ERRO]: "+error!.description)
            }
            
        }
        
//        // Teste de requisicao
//        var query = PFQuery(className:"Perfil")
//        query.findObjectsInBackgroundWithBlock{
//            (objects: [AnyObject]?, error: NSError?) -> Void in
//            println("Foram encontrados \(objects!.count) registros")
//            
//            if let objects = objects as? [PFObject] {
//                for obj in objects {
//                    println(obj)
//                }
//            } else {
//                println("[ERRO]: \(error!.userInfo)")
//            }
//        }
        
//        // Teste query com parametro
//        var query = PFQuery(className: "Perfil")
//        query.whereKey("objectId", equalTo: "KnHdnG0Vty")
//        query.findObjectsInBackgroundWithBlock {
//            (objects: [AnyObject]?, error: NSError?) -> Void in
//            
//            if let objects = objects as? [PFObject] {
//                for obj in objects {
//                    println(obj)
//                }
//            } else {
//                println("[ERRO]: \(error!.userInfo)")
//            }
//        }
        
//        let usuario = getPerfil("KnHdnG0Vty")
//        let tutorial = PFObject(className: "Tutorial")
//        tutorial["idPerfil"] = usuario
//        tutorial["Titulo"] = "-- Teste --"
//        tutorial["Descricao"] = "Descricao teste"
//        tutorial.saveInBackgroundWithBlock{
//            (success: Bool, error: NSError?) -> Void in
//            
//            if(success){
//                println("Mais um tutorial foi inserido")
//            } else {
//                println("[ERRO]: \(error!.userInfo)")
//            }
//        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    func getPerfil(idPerfil: String) -> PFObject? {
        // Teste query com parametro
        var query = PFQuery(className: "Perfil")
        query.whereKey("objectId", equalTo: idPerfil)
        return query.getFirstObject()
    }
}
