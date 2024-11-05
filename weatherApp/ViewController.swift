//
//  ViewController.swift
//  weatherApp
//
//  Created by Safa Karaca on 10.10.2024.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var degree: UILabel!
    var weatherCondition:String?
    
    let cities: [CityInfo] = [.malatya,.istanbul,.ankara,.izmir,.elazig]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        cityNameLabel.text = cities[0].rawValue

        
        // Do any additional setup after loading the view.
       
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityNameLabel.text = cities[row].rawValue
        let coordinates = CityInfo.coordinates(for: cities[row])
        
        NetworkManager.shared.getWeatherResponse(latitude: coordinates.latitude,longitude: coordinates.longitude){ [weak self] weatherData in
            guard let self else{
                return
            }
            let degre = String(weatherData.current.temperature2M)
            DispatchQueue.main.async {
                self.degree.text = degre
            }
        }
    }
    
}

