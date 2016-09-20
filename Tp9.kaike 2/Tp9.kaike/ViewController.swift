//
//  ViewController.swift
//  Tp9.kaike
//
//  Created by Kaique on 29/03/16.
//  Copyright © 2016 Kaike. All rights reserved.
//

import UIKit

var listaIndex:Int = 0

class ViewController: UIViewController, UITableViewDelegate{
    
    var Bairros: NSArray?

    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        
        
        if let bundlePath = NSBundle.mainBundle().pathForResource("BairrosPT", ofType: "plist") {
            if let dicionario = NSDictionary(contentsOfFile: bundlePath) {
                Bairros = dicionario["Bairros"] as? NSArray
                
            }
        }

        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (Bairros?.count)!
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("bairros", forIndexPath: indexPath)
        
        if let lugar = Bairros![indexPath.row] as? NSArray {
            cell.textLabel?.text = lugar[0] as? String
        }
        
        return cell
    }


    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        listaIndex = indexPath.row
        
        return indexPath
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

