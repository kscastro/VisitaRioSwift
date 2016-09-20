//
//  DetailViewController.swift
//  Tp9.kaike
//
//  Created by Kaique on 06/04/16.
//  Copyright © 2016 Kaike. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var endereco: UILabel!
    @IBOutlet weak var mapa: MKMapView!
    var teste:Dictionary = [String: String]()
    var rotas:CLLocationCoordinate2D?
    
    @IBAction func trocar(sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex){
        case 0:
            mapa.mapType = .Standard
        case 1:
            mapa.mapType = .Hybrid
        default:
            mapa.mapType = .Satellite
    }
   
}
    
    @IBAction func IrRotas(sender: AnyObject) {
        if self.rotas != nil{
            let lauchOptions = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
            let placemark = MKPlacemark(coordinate: self.rotas!, addressDictionary: nil )
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.openInMapsWithLaunchOptions(lauchOptions)
        }

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imagem.image = UIImage(named: teste["Imagem"]! as String)
        nome.text = teste["Nome"]! as String
        endereco.text = teste["Endereço"]! as String
        print(teste)
        CarregarGeocoder()
        
        
    }
    
    
    
    func CarregarGeocoder(){
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(endereco.text!){(placemarks, error) -> Void in
            if let placemark:CLPlacemark = placemarks?[0]{
                let location = placemark.location
                if let coords:CLLocationCoordinate2D = location?.coordinate{
                    print("Latitude = \(coords.latitude) , Longitude = \(coords.longitude)" )
                    self.rotas = coords
                        let region = MKCoordinateRegionMakeWithDistance(coords, 3000, 3000)
                        self.mapa.setRegion(region, animated: true)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = coords
                    annotation.title =  self.teste["Nome"]! as String
                    annotation.subtitle = self.teste["Endereço"]! as String
                    self.mapa.addAnnotation(annotation)
                    
                    
                }
                
            }
            else{
                print("Geocode falhou. Erro")
            }
            
        }
        
        }
}




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


