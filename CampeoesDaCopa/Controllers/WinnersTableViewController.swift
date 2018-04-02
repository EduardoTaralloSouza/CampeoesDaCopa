//
//  WinnersTableViewController.swift
//  CampeoesDaCopa
//
//  Created by Eduardo Tarallo on 22/03/2018.
//  Copyright © 2018 Eduardo Tarallo. All rights reserved.
//

import UIKit

class WinnersTableViewController: UITableViewController {

    // Array onde vou armazernar todas as informações do JSON
    var worldCups : [WorldCup] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Carregar todas as copas do mundo
        loadWorldCups()
    }
    
    //Método para passar as informaçoes para a proxima tela
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 1º Recuperar a tela
        let vc = segue.destination as! WorldCupViewController
        
        //linha selecionada
        let worldCup = worldCups[tableView.indexPathForSelectedRow!.row]
        
        vc.worldCup = worldCup
    }

    // Método criado para traduzir o JSON em um Array wordCups
    func loadWorldCups() {
        
        // Acessando o caminho do meu arquivo JSON atraves do BUNDLE
        let fileURL = Bundle.main.url(forResource: "winners.json", withExtension: nil)!
        
        // Transformando o arquivo JSON em Bytes
        let jsonData = try! Data(contentsOf: fileURL)
        
        // Decodificando meu arquivo JSON para o Array worldCups, ou seja, está traduzindo o arquivo json para o Array.
        do {
            worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Métodos de UITableViewDataSource
    
    
    // Método que define a quantidade de seções na tableView
    // OBS.: Quando utilizado apenas 1 seção, não precisa inplementar este método.
    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    // Método que define a quantidade de linhas em uma seção
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return worldCups.count
    }

    // Método para preparar a Celula
    // indexPath -> Contem as informações da celula | row -> define a linha que está celula representa
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WorldCupTableViewCell
        
        // colocando um titulo na celula
        let worldCup = worldCups[indexPath.row] 
        cell.prepare(with: worldCup)
       
        return cell
    }
}
