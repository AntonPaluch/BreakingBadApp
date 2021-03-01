//
//  CharacterCell.swift
//  BreakingBadApp
//
//  Created by Pandos on 01.03.2021.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameCharacterLabel: UILabel!
    @IBOutlet weak var occupationCharacterLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var statusCharacterLabel: UILabel!
        
    func configure(with character: Character) {
        nameCharacterLabel.text = character.name ?? ""
        occupationCharacterLabel.text = character.occupation?.joined() ?? ""
        nickNameLabel.text = "AKA \(character.nickname ?? "")"
        statusCharacterLabel.text = "status: \(character.status ?? "")"
        
        DispatchQueue.global().async {
            guard let stringURL = character.img else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.characterImage.image = UIImage(data: imageData)
            }
        }
    }
}


