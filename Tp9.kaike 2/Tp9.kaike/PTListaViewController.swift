//
//  PTListaViewController.swift
//  Tp9.kaike
//
//  Created by Kaique on 29/03/16.
//  Copyright © 2016 Kaike. All rights reserved.
//

import UIKit

class PTListaViewController: UIViewController, UITableViewDelegate {
    
    var bairro:NSArray?
    var listPT:NSArray = []
    var Ponto:NSDictionary?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let bundlePath = NSBundle.mainBundle().pathForResource("BairrosPT", ofType: "plist") {
            if let dicionario = NSDictionary(contentsOfFile: bundlePath) {
                bairro = dicionario["Bairros"] as? NSArray
                
            }
        }
        
        if let list = bairro![listaIndex] as? NSArray {
            listPT = list[1] as! NSArray
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listPT.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:PTTableViewCell = tableView.dequeueReusableCellWithIdentifier("placeCell", forIndexPath: indexPath) as! PTTableViewCell
        
        if let lugar:NSDictionary = listPT[indexPath.row] as? NSDictionary {
            Ponto = lugar
        }
        
        cell.Imagem.image = UIImage(named: Ponto!["Imagem"] as! String)
        cell.Nome.text = Ponto!["Nome"] as? String
        cell.Tipo.text = Ponto!["Tipo"] as? String
        cell.Endereco.text = Ponto!["Endereço"] as? String
        cell.nota.text = (Ponto!["Avaliacao"] as? String)! + " Nota do Publico"
        
        return cell
    }
    
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "mostrarDetalhes") {
            if let nextView = segue.destinationViewController as? DetailViewController {
                if let index = tableView.indexPathForSelectedRow {
                    if let lugar:NSDictionary = listPT[index.row] as? NSDictionary {
                        nextView.teste = lugar as! [String : String]
                    }
                }
                
            }
        }
    }

}