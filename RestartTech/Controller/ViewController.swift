//
//  ViewController.swift
//  RestartTech
//
//  Created by Riad Mohamed on 17/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var label: UILabel!
    @IBAction func buttonTapped(_ sender: UIButton) {
        // Call the webservice
        populateHome()
    }
    
    private func populateHome() {
        guard let homeURL = URL(string: K.homeURL) else {
            fatalError("Could not create the home URL")
        }
        
        let homeResource = Resource<HomeResponse>(url: homeURL)
        
        
        Webservice.shared.load(resource: homeResource) { [weak self] (result) in
            switch result {
            case .success(let homeResponse):
                print("Sucessful API Call")
                DispatchQueue.main.async {
//                    self!.label.text = homeResponse.data?.hotSpots[1].desc
//                    self!.label.text = homeResponse.data?.events[1].desc
                    self!.label.text = homeResponse.data?.attractions[1].desc
                    
                }
            case .failure(.networkingError):
                print("Failed API Call")
            
            case .failure(.JSONParingError):
                print("Failed to parse the response")
            case .failure(.urlParsingError):
                print("Failed to parse the URL")
            }
        }
        
        
    }
    
}
