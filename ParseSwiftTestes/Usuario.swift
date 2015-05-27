//
//  Usuario.swift
//  ParseSwiftTestes
//
//  Created by Humberto Vieira de Castro on 5/25/15.
//  Copyright (c) 2015 Ramon. All rights reserved.
//

import UIKit

class Usuario: NSObject {
    var email:String
    var senha:String
    var foto:UIImage
    
    override init() {
        email = ""
        senha = ""
        foto = UIImage()
    }
    
}
