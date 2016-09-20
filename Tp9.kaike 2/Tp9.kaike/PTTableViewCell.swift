//
//  PTTableViewCell.swift
//  Tp9.kaike
//
//  Created by Kaique on 29/03/16.
//  Copyright © 2016 Kaike. All rights reserved.
//

import UIKit

class PTTableViewCell: UITableViewCell {

   
    @IBOutlet weak var Imagem: UIImageView!
    @IBOutlet weak var Nome: UILabel!
    @IBOutlet weak var Tipo: UILabel!
    @IBOutlet weak var Endereco: UILabel!
    @IBOutlet weak var nota: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        Imagem.layer.cornerRadius = Imagem.frame.size.width/2
        Imagem.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
