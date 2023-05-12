//
//  ViewController.swift
//  JSon-Serilazation-Nested
//
//  Created by Mac on 11/05/23.
//

import UIKit
import Kingfisher
class ViewController: UIViewController {

    @IBOutlet weak var productTableViw: UITableView!
    var products:[Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        productTableViw.rowHeight = 200
        FetchData()
    }
    
    func FetchData() {
        guard let Url = URL(string: "https://fakestoreapi.com/products") else {
            print("Error")
            return
        }
        
        
        
        
         URLSession.shared.dataTask(with: Url) {
            Data,response,error in
//            print(Data)
//            print(response)
//            print(error)
            let jsonOnject = try! JSONSerialization.jsonObject(with: Data!) as! [[String:Any]]
            
            for eachObject in jsonOnject  {
                let eachEtrated = eachObject
                
                let eachId = eachEtrated["id"] as! Int
                let eachTitle = eachEtrated["title"] as! String
                let eachDescription = eachEtrated["description"] as! String
                let eachCategory = eachEtrated["category"] as! String
                let eachImage = eachEtrated["image"] as! String
                
                let eachRating = eachObject["rating"] as! [String:Any]
                let eachRate = eachRating["rate"] as! Double
                let eachCount = eachRating["count"] as! Int
                
//                print("eachId\(eachId) eachTitle \(eachTitle) eachDescription \(eachDescription)  eachCAtergory \(eachCategory)  eachimage\(eachImage)  eachRate \(eachRate) eachCOunt \(eachCount)")
//
                var ratingOfArray = Rating(rate: eachRate, count: eachCount)
                var arrayAppendData = Product(id: eachId, title: eachTitle, description: eachDescription, category: eachCategory, image: eachImage, rating: ratingOfArray)
                self.products.append(arrayAppendData)
                
            }
            DispatchQueue.main.sync {
                self.productTableViw.reloadData()
            }
            
            
        }.resume()
    }

}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTableViw.dequeueReusableCell(withIdentifier: "TableViewCellProduct", for: indexPath) as! TableViewCellProduct
        cell.backgroundColor = .red
        cell.titleLbl.text = products[indexPath.item].title
        let rateUse  = products[indexPath.item].rating
        cell.priceLbl.text = rateUse.rate.description
        let url = URL(string: products[indexPath.row].image)
        cell.imageViewLbl.kf.setImage(with: url)
        cell.descriptionLabel.text = products[indexPath.item].description
        return cell
    }
    
    
}

