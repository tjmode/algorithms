//
//  DetailViewController.swift
//  FlamesGames
//
//  Created by Tonywilson Jesuraj on 17/06/20.
//  Copyright © 2020 Tonywilson Jesuraj. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var firstName = ""

    @IBOutlet weak var ans: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.ans.text = firstName
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
