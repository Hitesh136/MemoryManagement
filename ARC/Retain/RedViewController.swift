//
//  RedViewController.swift
//  UIKit4Playground
//
//  Created by Hitesh Agarwal on 01/05/21.
//

import UIKit


class RedViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionBack(_ sender: Any) {
        let redViewController = self.storyboard?.instantiateViewController(identifier: "OrangeViewController")
//        self.navigationController?.pushViewController(redViewController!, animated: true)
        
        present(redViewController!, animated: true, completion: nil)
    }
}
