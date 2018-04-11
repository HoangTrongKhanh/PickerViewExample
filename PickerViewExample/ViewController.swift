//
//  ViewController.swift
//  PickerViewExample
//
//  Created by Hoàng Khánh on 4/11/18.
//  Copyright © 2018 Hoàng Khánh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    let rowHeight:CGFloat = 50.0
    var flowerNames = ["Rose", "Lily", "Holy", "Jasmine", "Daisy", "Alyssum", "Violet", "Ivy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.selectRow(flowerNames.count/2, inComponent: 0, animated: true)
        label.text = flowerNames[flowerNames.count/2]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return flowerNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return rowHeight
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return flowerNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = flowerNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let lbl:UILabel?
        if(view == nil) {
            lbl = UILabel(frame: CGRect(x: 0, y: 0, width: pickerView.frame.width, height: rowHeight))
        } else {
            lbl = view as? UILabel
        }
        lbl!.text = flowerNames[row]
        lbl?.textAlignment = .center
        lbl?.font = UIFont.boldSystemFont(ofSize: 18)
        lbl?.textColor = .white
        lbl?.backgroundColor = .gray
        return lbl!
    }

}
