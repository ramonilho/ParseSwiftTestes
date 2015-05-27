//
//  UsuarioController.swift
//  ParseSwiftTestes
//
//  Created by Humberto Vieira de Castro on 5/26/15.
//  Copyright (c) 2015 Ramon. All rights reserved.
//

import UIKit
import Parse


class UsuarioController: NSObject {
   
    func usuarioExiste(let u:Usuario) -> Usuario?
    {
        var usuario = Usuario()
        
        var query = PFQuery(className: "perfil")
        query.whereKey("email", equalTo: u.email)
        query.whereKey("senha", equalTo: u.senha)
        
        if var objeto: AnyObject = query.getFirstObject() as PFObject? as? AnyObject {
            usuario.email = objeto["email"] as! String
            usuario.senha = objeto["senha"] as! String
            return usuario
        }
        
        return nil
    }
    
    
    func listaUsuario(let tela:ParseTableViewController){
        var query = PFQuery(className: "perfil")
        //query.limit = 4
        query.skip = 1
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if let objects = objects as? [PFObject] {
                for obj in objects {
                    var u = Usuario()
                    u.email = obj["email"] as! String
                    u.senha = obj["senha"] as! String
                    
                    if((obj["foto"]) != nil)
                    {
                        let imagemCarregando = (obj["foto"] as! PFFile)
                        u.foto = UIImage(data: imagemCarregando.getData()!)!
                    }
                    
                    
                    tela.array.append(u)
                    
                    //self.tableView.reloadData()
                    
                    tela.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: .Automatic)
                    
                    //println(u.email)
                }
            } else {
                //println("[ERRO]: \(error!.userInfo)")
            }
        }
    }
}
