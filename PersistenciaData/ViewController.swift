//
//  ViewController.swift
//  PersistenciaData
//
//  Created by Narciso Reyes on 30/04/20.
//  Copyright © 2020 Narciso Reyes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var texto: UITextField!
    @IBOutlet weak var bar: UINavigationBar!
    @IBOutlet weak var save: UIBarButtonItem!
    @IBOutlet var botons: [UIButton]!
    @IBOutlet weak var textonocturno: UILabel!
    @IBOutlet weak var botonSwitch: UISwitch!
    
    
    let iron = UIColor(red: 94/255, green: 94/255, blue: 94/255, alpha: 1)
    let magnesium = UIColor(red: 194/255, green: 194/255, blue: 194/255, alpha: 1)
    let dark = UIColor.black
    let white = UIColor.white
    let cantaloupe = UIColor(red: 255/255, green: 212/255, blue: 121/255, alpha: 1)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guardandoArrays()
        modoNocturno()
    }


    @IBAction func save(_ sender: UIBarButtonItem) {
        
        UserDefaults.standard.set(texto.text, forKey: "Texto")
        print("guardo")
        texto.text = ""
    }
    
    
    @IBAction func mostrar(_ sender: UIButton) {
        texto.text = UserDefaults.standard.object(forKey: "Texto") as? String
    }
    
    
    @IBAction func eliminar(_ sender: UIButton) {
        
        UserDefaults.standard.removeObject(forKey: "Texto")
        
    }
    
    func guardandoArrays() {
        let animales = ["caballo","perro","gato","aguila"]
        UserDefaults.standard.set(animales, forKey: "arrayString")
        print("Guardo el array de animales")
        let myArray = UserDefaults.standard.stringArray(forKey: "arrayString")
        print(myArray!)
        print(myArray![0])
        
        let numeros = [22,32,34,44,55,77]
        UserDefaults.standard.set(numeros, forKey: "numeros")
        print("guardo array de numeros")
        let myArrayInt = UserDefaults.standard.array(forKey: "numeros")
        print(myArrayInt!)
        print(myArrayInt![2])
    }
    
  
    @IBAction func cambio(_ sender: UISwitch) {
        if botonSwitch.isOn {
                   self.view.backgroundColor = iron
                   botons[0].backgroundColor = magnesium
                   botons[1].backgroundColor = magnesium
                   botons[0].setTitleColor(dark, for: .normal)
                   botons[1].setTitleColor(dark, for: .normal)
                   bar.barTintColor = magnesium
                   save.tintColor = dark
                   textonocturno.textColor = white
                   botonSwitch.thumbTintColor = magnesium
            UserDefaults.standard.set(botonSwitch.isOn, forKey: "estatus")

               }else {
                  self.view.backgroundColor = white
                  botons[0].backgroundColor = cantaloupe
                  botons[1].backgroundColor = cantaloupe
                  botons[0].setTitleColor(white, for: .normal)
                  botons[1].setTitleColor(white, for: .normal)
                  bar.barTintColor = cantaloupe
                  save.tintColor = white
                  textonocturno.textColor = dark
                  botonSwitch.thumbTintColor = cantaloupe
            UserDefaults.standard.removeObject(forKey: "estatus")
            
               }
    }
    func modoNocturno(){
        if (UserDefaults.standard.object(forKey: "estatus") != nil) {
            self.view.backgroundColor = iron
            botons[0].backgroundColor = magnesium
            botons[1].backgroundColor = magnesium
            botons[0].setTitleColor(dark, for: .normal)
            botons[1].setTitleColor(dark, for: .normal)
            bar.barTintColor = magnesium
            save.tintColor = dark
            textonocturno.textColor = white
            botonSwitch.thumbTintColor = magnesium
            botonSwitch.isOn = true
        }
    }
}

