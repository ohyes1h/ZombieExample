//
//  DetailViewController.swift
//  Observation
//
//  Created by Sih Ouyang on 2021/8/23.
//

import UIKit

@objcMembers
class DetailViewController: UIViewController {
    dynamic weak var connector: Connector!
    var observation: NSKeyValueObservation?
    
    weak var toggleButton: UIButton!
    weak var dismissButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Note: observation would not invalidate automatically when the object(DetailViewController) is no long used even the deinit method has called
        observation = observe(\.connector.isConnected, options: [.new]) { (_, change) in
            print("value changed: \(change.newValue!)")
        }
        
        // Note: observation will invalidate automatically when the object(DetailViewController) is no long used
//        observation = connector.observe(\.isConnected, options: [.new]) { (_, change) in
//            print("value changed: \(change.newValue!)")
//        }
        
        let toggleButton = UIButton(type: .system)
        toggleButton.frame = CGRect(x: 60, y: 100, width: 100, height: 40)
        view.addSubview(toggleButton)
        self.toggleButton = toggleButton
        
        toggleButton.addTarget(self, action: #selector(toggleTapped), for: .touchUpInside)
        toggleButton.setTitle("toggle", for: .normal)
        
        let dismissButton = UIButton(type: .system)
        dismissButton.frame = CGRect(x: 60, y: 160, width: 100, height: 40)
        view.addSubview(dismissButton)
        self.dismissButton = dismissButton
        
        dismissButton.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
        dismissButton.setTitle("dismiss", for: .normal)
    }
    
    @objc func toggleTapped() {
        connector.isConnected.toggle()
    }
    
    @objc func dismissTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        observation?.invalidate()
        print("deinit")
    }
}


