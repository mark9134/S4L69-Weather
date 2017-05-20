//
//  ViewController.swift
//  S4L69 Weather
//
//  Created by Mark Sherman on 5/19/17.
//  Copyright © 2017 Mark Sherman. All rights reserved.
//

import UIKit


struct dataModel {
    // http://www.weather-forecast.com/locations/Raleigh/forecasts/latest
    
    let weatherURLStrLead = "https.weather-forecast.com/locations"
    let weatherURLStrTrailer = "/forecasts/latest"
    var location = "Raleigh"
    var completeURL: URL!
    init(_ forLocation: String) {
    
        completeURL = URL(string: weatherURLStrLead + forLocation + weatherURLStrTrailer)
    }
    
    func getData() {
        if completeURL != nil {
            
            let task = URLSession.shared.dataTask(with: completeURL!) {
                data, response, error in
                guard error == nil else {
                    print(error!)
                    return
                }
            guard data != nil else {
                print("Data is empty")
                return
            }
        }
        task.resume()
            
        }
    }
    
}
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var cityTextField: UITextField!
    @IBAction func submitButtonTouched(_ sender: UIButton) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.cityTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

