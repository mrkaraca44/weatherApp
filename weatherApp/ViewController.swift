//
//  ViewController.swift
//  weatherApp
//
//  Created by Safa Karaca on 10.10.2024.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var image: LottieAnimationView!
    @IBOutlet weak var degree: UILabel!
    var weatherCondition:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        NetworkManager.shared.getWeatherResponse(){ [weak self] weatherData in
            guard let self else{
                return
            }
            let degre = String(weatherData.current.temperature2M)
            DispatchQueue.main.async {
                self.degree.text = degre
            }
            
            let weatherConditionType = WeatherCondition.set(for: weatherData.current.weather_code)
            getWeatherCondition(weatherCondition: weatherConditionType.rawValue)
            
        }
       
    }
    
    func getWeatherCondition(weatherCondition:String){
        
        
        image.loopMode = .loop
        
        let url = Bundle.main.url(forResource: weatherCondition,
                                  withExtension: "lottie")!
        DotLottieFile.loadedFrom(url: url) { [weak self] result in
            guard let self else {
                return
            }
            switch result {
            case .success(let success):
                image.loadAnimation(from:
                success)
                image.play()
            case .failure(let failure):
                print(failure)
            }
        }
       
    }
}

