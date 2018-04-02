//
//  WorldCupViewController.swift
//  CampeoesDaCopa
//
//  Created by Eduardo Tarallo on 22/03/2018.
//  Copyright © 2018 Eduardo Tarallo. All rights reserved.
//

import UIKit

class WorldCupViewController: UIViewController {

    // MARK - Outlets
    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbWinner: UILabel!
    @IBOutlet weak var lbVice: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    var worldCup: WorldCup!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "WorldCup  \(worldCup.year)"
        
        ivWinner.image = UIImage(named: "\(worldCup.winner).png")
        ivVice.image = UIImage(named: "\(worldCup.vice).png")
        lbScore.text = "\(worldCup.winnerScore) x \(worldCup.viceScore)"
        lbWinner.text = worldCup.winner
        lbVice.text = worldCup.vice
        
    }
}


//MARK - Extensão
extension WorldCupViewController: UITableViewDelegate {
    
}

extension WorldCupViewController: UITableViewDataSource {
    
    // Método que define a quantidade de seções na tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return worldCup.matches.count
    }
    
    // Método que define a quantidade de linhas em uma seção
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let games = worldCup.matches[section].games
        return games.count
    }
    
    // Método para preparar a Celula
    // indexPath -> Contem as informações da celula | row -> define a linha que está celula representa
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
        let match = worldCup.matches[indexPath.section]
        let game  = match.games[indexPath.row]
            
        cell.prepare(with: game)
        return cell
    }
    
    // Método para um titulo de seção
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let match = worldCup.matches[section]
        return match.stage
    }
    
}












