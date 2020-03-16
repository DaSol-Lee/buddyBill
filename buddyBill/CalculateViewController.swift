//
//  CalculateViewController.swift
//  buddyBill
//
//  Created by Greta Yu on 3/15/20.
//  Copyright © 2020 dasol. All rights reserved.
//
// post request based on Kilo-Loco

import UIKit

class CalculateViewController: UIViewController {
        
    var unscaledImage: UIImage!
    var receiptAmounts = [[String:Any]]()
    
    var itemArray = [String]()
    var priceArray = [Float]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        postRequest()
        
        getReceiptArrays()
           
        self.performSegue(withIdentifier: "confirmSegue", sender: nil)
    }
    
    func getReceiptArrays() {
        let semaphore = DispatchSemaphore(value: 0)
        
        for amount in self.receiptAmounts {
            var line = amount["text"] as! String
            line = line.lowercased()
            if !line.contains("tax") && !line.contains("total") && !line.contains("sub") {
                let words = line.components(separatedBy: " ")
                itemArray.append(words.prefix(words.count-1).joined(separator: " "))
                priceArray.append(Float(words.last!)!)
            }
        }
        print("itemArray", itemArray)
        print("priceArray", priceArray)
        semaphore.signal()
        
        semaphore.wait()
    }
    
    func postRequest() {
        let semaphore = DispatchSemaphore(value: 0)
        
        let parameters = ["language": "en"]
        guard let mediaImage = Media(withImage: unscaledImage, forKey: "file") else { return }
        
        guard let url = URL(string: "https://api.taggun.io/api/receipt/v1/verbose/file?apikey=d6a12960667e11ea8bfadfb7eb1aa8b5") else { return }
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        request.httpMethod = "POST"
        
        request.setValue("multipart/form-data; boundary=OurBoundary", forHTTPHeaderField: "Content-Type")
        request.setValue("d6a12960667e11ea8bfadfb7eb1aa8b5", forHTTPHeaderField: "apikey")
        
        let dataBody = createDataBody(withParameters: parameters, media: mediaImage, boundary: "OurBoundary")
        request.httpBody = dataBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("ERROR IS\n", error.localizedDescription)
            } else if let response = response {
                print("RESPONSE IS\n", response)
            }
            
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.receiptAmounts = dataDictionary["amounts"] as! [[String:Any]]
                semaphore.signal()
            }
        }.resume()
        
        semaphore.wait()
    }
    
    func createDataBody(withParameters params: [String: String]?, media: Media?, boundary: String) -> Data {
        print("create data body")
        
        let lineBreak = "\r\n"
        var body = Data()
        
        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
                body.append("\(value + lineBreak)")
            }
        }
        
        if let media = media {
            body.append("--\(boundary + lineBreak)")
            body.append("Content-Disposition: form-data; name=\"\(media.key)\"; filename=\"\(media.filename)\"\(lineBreak)")
            body.append("Content-Type: \(media.mimeType + lineBreak + lineBreak)")
            body.append(media.data)
            body.append(lineBreak)
        }
        
        body.append("--\(boundary)--\(lineBreak)")
        
        return body
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let confirmViewController = segue.destination as! ConfirmViewController
        confirmViewController.itemArray = itemArray
        confirmViewController.priceArray = priceArray
    }

}

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
