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
    var array = [Usuario]()
    var cloud = UsuarioController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var u = Usuario()
        u.email = "ramodn@email.com"
        u.senha = "1234"
        
        var user:Usuario = cloud.usuarioExiste(u)!
        if(user.email == "" && user.senha == "")
        {
            println("---------ERROR------------")
        }else{
            println("---------" + user.email + "------------")
        }
        
        //println("---------" + user.email + "------------")
        
        cloud.listaUsuario(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.array.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        var imageView = cell.viewWithTag(101) as? UIImageView
        var labelEmail = cell.viewWithTag(102) as? UILabel
        var labelSenha = cell.viewWithTag(103) as? UILabel
        
        imageView?.image = self.array[indexPath.row].foto
        labelEmail?.text = self.array[indexPath.row].email
        labelSenha?.text = self.array[indexPath.row].senha
        
        
        return cell
    }
    

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
