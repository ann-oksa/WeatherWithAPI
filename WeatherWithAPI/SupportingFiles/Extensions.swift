//
//  Extensions.swift
//  WeatherWithAPI
//
//  Created by Anna Oksanichenko on 18.11.2020.
//

import UIKit

extension ViewController {
    func presentSearchAlertController(withTitle title: String?, message: String, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addTextField { textfield in
            let cities = ["Moscow", "Kiyv", "New York", "Stambul"]
            textfield.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: UIAlertAction.Style.default) { action in
            let textField = alert.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city  = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        let cancel =  UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(search)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}
