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
    
    //for testing only
    @IBAction func skipButton(_ sender: Any) {
        self.performSegue(withIdentifier: "confirmSegue", sender: nil)
    }
        
    var unscaledImage: UIImage!
    var receiptItems = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postRequest()
        
        // do calcs
        
        // prep list for segue
        
        // self.performSegue(withIdentifier: "confirmSegue", sender: nil)
    }
    
    func postRequest() {
        let parameters = ["language": "en"]
        guard let mediaImage = Media(withImage: unscaledImage, forKey: "file") else { return }
        
//        guard let url = URL(string: "https://api.taggun.io/api/receipt/v1/verbose/file") else { return }
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
                print("ERROR IS\n======", error.localizedDescription)
            } else if let response = response {
                print("RESPONSE IS\n======", response)
            }
            
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.receiptItems = dataDictionary["amounts"] as! [[String:Any]]
                print(self.receiptItems)
            }
        }.resume()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // mnu
        // Get the new view controller using segue.destination.
        // Pass the selected receipt lines to the confirm view controller.
    }

}

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
