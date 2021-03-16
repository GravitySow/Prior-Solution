//
//  DetailVC.swift
//  Prior Solution
//
//  Created by มิตรภาพ สกุลพิสุทธิ์ on 16/3/21.
//

import UIKit

class DetailVC: UIViewController {

    //var data = Data()
    var Result : MyResults?
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = ("Name: \((Result?.name)!)\nStatus: \((Result?.status)!)\nSpecies: \((Result?.species)!)\nType: \((Result?.type)!)\nGender: \((Result?.gender)!)\n")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


