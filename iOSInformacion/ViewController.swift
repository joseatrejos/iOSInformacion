//
//  ViewController.swift
//  iOSInformacion
//
//  Created by Alumno on 10/1/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvContactos: UITableView!
    var contactos : [Contacto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contactos"
        
        contactos.append(Contacto(nombre: "José Alberto Trejo Serrano", telefono: 6622971893, direccion: "Paseo de la Floresta 59", correo: "joseatrejos@hotmail.com", foto: "Perfil1"))
        contactos.append(Contacto(nombre: "Leticia Serrano Genda", telefono: 6623004022, direccion: "Paseo de la Floresta 59", correo: "letticiaserranog@gmail.com", foto: "Perfil2"))
        contactos.append(Contacto(nombre: "Ismael Trejo Bazúa", telefono: 6622689298, direccion: "Paseo de la Floresta 59", correo: "itrejob@hotmail.com", foto: "Perfil3"))
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaContacto") as? CeldaContactoController
        
        celda?.imgContacto.image = UIImage(named: contactos[indexPath.row].foto!)
        celda?.lblNombre.text = contactos[indexPath.row].nombre
        celda?.lblTelefono.text = "\(contactos[indexPath.row].telefono!)"
        
        return celda!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEditar" {
            let destino = segue.destination as? EditarContactoController
            
            destino?.contacto = contactos[tvContactos.indexPathForSelectedRow!.row]
        }
    }
}
