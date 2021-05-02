//
//  OrangeViewController.swift
//  UIKit4Playground
//
//  Created by Hitesh Agarwal on 01/05/21.
//

import UIKit

class OrangeService {
    var parent: OrangeViewController
    init(parent: OrangeViewController) {
        self.parent = parent
        print("Orange init")
    }
    
    deinit {
        print("Orange Service deinit")
    }
}

class OrangeViewController: UIViewController {

    //Memory link can't detactable in instruments
    var viewControllerClosure: (() -> ())?
    var orangeService: OrangeService!
    
    // Memory link detactable in instruments.
    var person: Person?
    var job: Job?

//    implicit unwrapped optional will create a referance link to the root. Please check the memory debug graph. Regular optional property will don't create the referance link to the root.
    //Memory link can't detactable in instruments
//    var person: Person!
//    var job: Job!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
//        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionButton1() {
        orangeService = OrangeService(parent: self)
    }
    
    @IBAction func actionButton2() {
        viewControllerClosure = { [self] in
            print("changing view's background color")
            self.view.backgroundColor = .yellow
        }
        viewControllerClosure?()
    }
    
    @IBAction func actionButton3() {
        person = Person()
        job = Job()
        
        person?.job = job
        job?.person = person
    }
    
    deinit {
        print("deinit orange view controller")
    }
}

class Person {
    var job: Job?
    init() {
        print("init person")
    }
    deinit {
        print("deinit person")
    }
}

class Job {
    var person: Person?
    init() {
        print("init job")
    }
    deinit {
        print("deinit job")
    }
}

