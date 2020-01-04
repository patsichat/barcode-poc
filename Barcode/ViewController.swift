//
//  ViewController.swift
//  Barcode
//
//  Created by Patsicha Tongteeka on 1/4/20.
//  Copyright © 2020 SCB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var barcodeView: BarcodeView!
    @IBOutlet private var inputTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func generateAction(_ sender: Any) {
        guard let string = inputTextField.text else {
            return
        }
        barcodeView.updateUI(string: string)
    }


}

