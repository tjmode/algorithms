//
//  ViewController.swift
//  FlamesGames
//
//  Created by Tonywilson Jesuraj on 17/06/20.
//  Copyright © 2020 Tonywilson Jesuraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func checkIt(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailView") as? DetailViewController {
            vc.firstName = firstName.text ?? ""
            self.navigationController!.pushViewController(vc, animated: true)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

