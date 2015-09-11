//
//  Mini3TableViewController.swift
//  ParseSwiftTestes
//
//  Created by Ramon Honorio on 7/14/15.
//  Copyright (c) 2015 Ramon. All rights reserved.
//

import UIKit
import Parse

protocol PSTRequisicoesProtocol{
    func requisicaoHistoriasTerminou()
    
}

class Mini3TableViewController: UITableViewController, PSTRequisicoesProtocol {
    var delegate: PSTRequisicoesProtocol!
    var arrayHistorias = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
//        self.loginTeste()
        
//        self.logout()
        
//        self.recuperarHistorias()
        
//        self.efetuarLike()
        
//        self.efetuarDeslike()

//        self.relacionarComentario()
        
//        self.adicionarComentario()
        
        var usuarioReceptor = PFUser(withoutDataWithClassName: "_User", objectId: "1OEnTEGoDr")
        
        var query = PFInstallation.query()
        query?.whereKey("user", equalTo: usuarioReceptor)
        
        var push = PFPush()
        push.setQuery(query)
        push.setMessage("Well, it's a push...")
        push.sendPushInBackgroundWithBlock(nil)
        
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
    
    func getRegistro(idRegistro: String, tabela: String) -> PFObject {
        var query = PFQuery(className: tabela)
        query.whereKey("objectId", equalTo: idRegistro)
        return query.getFirstObject()!
    }
    
    func inserirHistoria(){
        // INSERCAO: Historia
        var historia = PFObject(className: "Historia")
        historia["descricao"] = "Uma historia triste"
        historia.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if(success){
                println("Registro salvo.")
            } else {
                println("[ERRO]: \(error!.description)")
            }
        }
    }
    
    func loginTeste(){
        if var user = PFUser.logInWithUsername("teste", password: "teste") {
            println("Logado como \"\(user.username!)\"!")
        }
    }
    
    func logout(){
        PFUser.logOut()
    }
    
    func recuperarUsuarios(){
        // REQUISICAO: User
        var query = PFQuery(className:"_User")
        query.findObjectsInBackgroundWithBlock{
            (objects: [AnyObject]?, error: NSError?) -> Void in
            println("Foram encontrados \(objects!.count) registros")

            if let objs = objects as? [PFUser] {
                for obj in objs {
                    println(obj["Nome"]!)
                }
                
            } else {
                println("[ERRO]: \(error!.userInfo)")
            }
        }
    }
    
    func recuperarHistorias() {
        // REQUISICAO: Historia
        var historias = [PFObject]()
        var query = PFQuery(className:"Historia")
        query.findObjectsInBackgroundWithBlock{
            (objects: [AnyObject]?, error: NSError?) -> Void in
            println("Foram encontrados \(objects!.count) registros")

            if let objects = objects as? [PFObject] {
                self.arrayHistorias = objects
                self.delegate.requisicaoHistoriasTerminou()
            } else {
                println("[ERRO]: \(error!.userInfo)")
            }
        }
    }
    
    func requisicaoHistoriasTerminou() {
        for obj in self.arrayHistorias {
            println(obj["descricao"]!)
        }
        self.relacionarComentario()
    }
    
    func relacionarComentario(){
        var query = PFQuery(className: "Historia")
        query.whereKey("objectId", equalTo: "zw6PGZkkkZ")
        var historia = query.getFirstObject()
        
        query = PFQuery(className: "Comentario")
        query.whereKey("objectId", equalTo: "Bs7RFzSyw7")
        var comentario = query.getFirstObject()
        
        var relation = historia?.relationForKey("relationComentarios")
        relation?.addObject(comentario!)
        
        historia?.saveInBackgroundWithBlock({
            (success, error) -> Void in
            if(success){
                println("Comentario adicionado com sucesso.")
            }
        })
        
    }
    
    func adicionarComentario(){
        var query = PFQuery(className: "Historia")
        var historia = query.getObjectWithId("YdHzaC3mQZ")
        
        query = PFQuery(className: "_User")
        var autor = query.getObjectWithId("yXikCJteZ4")

        var comentario = PFObject(className: "Comentario")
        comentario["autor"] = autor
        comentario["historia"] = historia
        comentario["texto"] = "Testando mais uma vez!"
        
        
        comentario.saveInBackgroundWithBlock { (success, error) -> Void in
            if (success) {
                println("Comentario foi salvo.")
            }
        }
    }
    
    func efetuarLike(){
        let user = PFUser.currentUser()
        var query = PFQuery(className: "Historia")
        var historia = query.getObjectWithId("zw6PGZkkkZ")
        
        // Checo se o like ja não tenha sido feito pelo usuario, para nao contabilizar duas vezes
        var queryLike = PFQuery(className: "Historia")
        queryLike.whereKey("relationLikes", equalTo: user!.objectId!)
        if let likeJaEfetuado = queryLike.getFirstObject() {
            println("Like ja foi efetuado.")
        } else {
            var qtdLikes = historia?["numeroLikes"] as? Int
            
            historia?["numeroLikes"] = qtdLikes!+1
            
            var relation = historia?.relationForKey("relationLikes")
            relation?.addObject(user!)
            historia?.saveInBackgroundWithBlock({
                (success:Bool, error:NSError?) -> Void in
                if(success){
                    println("Like efetuado com sucesso")
                } else {
                    println(error?.description)
                }
            })
        }
    }
    
    func efetuarDeslike(){
        let user = PFUser.currentUser()
        var query = PFQuery(className: "Historia")
        var historia = query.getObjectWithId("YdHzaC3mQZ")
        
        var queryLike = PFQuery(className: "Historia")
        queryLike.whereKey("relationLikes", equalTo: user!.objectId!)
        
        if let likeJaEfetuado = queryLike.getFirstObject() {
            var qtdLikes = historia!["numeroLikes"] as? Int
            historia!["numeroLikes"] = qtdLikes!-1
            var relation = historia?.relationForKey("relationLikes")
            relation?.removeObject(user!)
            historia?.saveInBackgroundWithBlock({
                (success:Bool, error:NSError?) -> Void in
                if(success){
                    println("Deslike efetuado com sucesso")
                } else {
                    println(error?.description)
                }
            })
        } else {
            println("Impossivel dar deslike sem ter dado like .-.")
        }
    }
    
}
