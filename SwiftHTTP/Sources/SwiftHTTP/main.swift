import Foundation

let url = URL(string: "https://opentdb.com/api.php?amount=1&category=9&difficulty=easy&type=multiple")

let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
    
    if let data = data {
        do {
            // Convert the data to JSON
            let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]

            if let json = jsonSerialized {
                let results = json["results"] as! NSArray
                print(results)
            }
            
        }  catch let error as NSError {
            print(error.localizedDescription)
        }
    } else if let error = error {
        print(error.localizedDescription)
    }
}

task.resume()

// Infinitely run the main loop to wait for our request.
// Only necessary if you are testing in the command line.
RunLoop.main.run()
