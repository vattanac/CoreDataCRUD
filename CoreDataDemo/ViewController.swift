//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Vattanac on 12/5/18.
//  Copyright © 2018 vattanac. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {
    
    let persistenceManager: PersistenceManager
    init(persistenceManager: PersistenceManager){
        self.persistenceManager = persistenceManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatUser()
        getUser()
    }
    
    func creatUser(){
        let user = Users(context: persistenceManager.context)
        user.age = "168"
        user.password = "12345"
        user.username = "Khouch"
        
        persistenceManager.save()
    }
    
    func getUser(){
        //*When we aren't create method fetch() in PersistenceManager class yet*//
        //        guard let users = try! persistenceManager.context.fetch(Users.fetchRequest()) as? [Users] else {return}
        
        let users = persistenceManager.fetch(Users.self)
        users.forEach({print($0.age! ,$0.password!,$0.username!)})
    }
    
    
}

