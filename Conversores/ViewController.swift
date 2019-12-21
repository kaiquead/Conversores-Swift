//
//  ViewController.swift
//  Conversores
//
//  Created by Kaique Alves on 23/11/19.
//  Copyright © 2019 Kaique Alves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lbUnidade: UILabel!
    @IBOutlet weak var tfValor: UITextField!
    @IBOutlet weak var btnUnidade1: UIButton!
    @IBOutlet weak var btnUnidade2: UIButton!
    @IBOutlet weak var lbResultado: UILabel!
    @IBOutlet weak var lbResultadoUnidade1: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func mostrarProximo(_ sender: UIButton) {
        switch lbUnidade.text!{
            case "Temperatura":
                lbUnidade.text = "Peso"
                btnUnidade1.setTitle("Kilograma", for: .normal)
                btnUnidade2.setTitle("Libra", for: .normal)
            case "Peso":
                lbUnidade.text = "Moeda"
                btnUnidade1.setTitle("Real", for: .normal)
                btnUnidade2.setTitle("Dolar", for: .normal)
            case "Moeda":
                lbUnidade.text = "Distancia"
                btnUnidade1.setTitle("Metro", for: .normal)
                btnUnidade2.setTitle("Kilometro", for: .normal)
            default:
                lbUnidade.text = "Temperatura"
                btnUnidade1.setTitle("Celsius", for: .normal)
                btnUnidade2.setTitle("Fahrenheit", for: .normal)
        }
        Conversao(nil)
        
    }
    
    @IBAction func Conversao(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btnUnidade1{
                btnUnidade2.alpha = 0.5
            }
            else{
                btnUnidade1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch lbUnidade.text!{
            case "Temperatura":
                calcTemperatura()
            case "Peso":
                calcPeso()
            case "Moeda":
                calcMoeda()
            default:
                calcDistancia()
            }
        view.endEditing(true) //sumir o teclado
        let result = Double(lbResultado.text!)!
        lbResultado.text = String(format: "%.2f", result)
    }
    
    func calcTemperatura(){
        guard let temperatura = Double(tfValor.text!) else {return}
        if btnUnidade1.alpha == 1.0{
            lbResultado.text = String(temperatura * 1.8 + 32.0)
            lbResultadoUnidade1.text = "Fahrenheit"
        }
        else{
            lbResultadoUnidade1.text = "Celsius"
            lbResultado.text = String((temperatura - 32.0) / 1.8)
        }
    }
    
    func calcPeso(){
        guard let peso = Double(tfValor.text!) else {return}
        if btnUnidade1.alpha == 1.0{
            lbResultado.text = String(peso / 2.2046)
            lbResultadoUnidade1.text = "Libra"
        }
        else{
            lbResultadoUnidade1.text = "Kilograma"
            lbResultado.text = String (peso * 2.2046)
        }
    }
    
    func calcMoeda(){
        guard let moeda = Double(tfValor.text!) else {return}
        if btnUnidade1.alpha == 1.0{
            lbResultado.text = String(moeda / 4.23)
            lbResultadoUnidade1.text = "Dolar"
        }
        else{
            lbResultadoUnidade1.text = "Real"
            lbResultado.text = String(moeda * 4.23)
        }
    }
    
    func calcDistancia(){
        guard let distancia = Double(tfValor.text!) else {return}
        if btnUnidade1.alpha == 1.0{
            lbResultado.text = String(distancia / 1000.0)
            lbResultadoUnidade1.text = "Kilometro"
        }
        else{
            lbResultadoUnidade1.text = "Metros"
            lbResultado.text = String(distancia * 1000.0)
        }
    }
}

