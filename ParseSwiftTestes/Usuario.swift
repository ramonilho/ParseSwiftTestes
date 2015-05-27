//
//  Usuario.swift
//  ParseSwiftTestes
//
//  Created by Humberto Vieira de Castro on 5/25/15.
//  Copyright (c) 2015 Ramon. All rights reserved.
//

import UIKit
import Foundation

class Usuario: NSObject {
    var email:String
    var senha:String
    var foto:UIImage
    
    override init() {
        email = ""
        senha = ""
        foto = UIImage()
    }
    
    init(coder aDecoder: NSCoder!){
        self.email = aDecoder.decodeObjectForKey("email") as! String
        self.senha = aDecoder.decodeObjectForKey("senha") as! String
        self.foto = aDecoder.decodeObjectForKey("foto") as! UIImage
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(email, forKey: "email")
        aCoder.encodeObject(senha, forKey: "senha")
        aCoder.encodeObject(foto, forKey: "foto")
    }
    
}
