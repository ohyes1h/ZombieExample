//
//  ViewController.swift
//  Observation
//
//  Created by Sih Ouyang on 2021/8/23.
//

import UIKit

class ViewController: UIViewController {
    var connector: Connector!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        connector = Connector()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        connector.isConnected.toggle()
    }
    
    @IBAction func detailTapped(_ sender: Any) {
        let vc = DetailViewController()
        vc.connector = connector
        present(vc, animated: true)
    }
    
}

