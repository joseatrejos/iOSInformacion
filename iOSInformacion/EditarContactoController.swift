//
//  EditarContactoController.swift
//  iOSInformacion
//
//  Created by Alumno on 10/1/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit

class EditarContactoController : UIViewController {
    
    var contacto : Contacto?
    var callbackActualizarTabla: (() -> Void)?

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    @IBOutlet weak var txtDireccion: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    
    override func viewDidLoad() {
        txtNombre.text = contacto!.nombre
        txtTelefono.text = "\(contacto!.telefono!)"
        txtDireccion.text = contacto!.direccion
        txtCorreo.text = contacto!.correo
    }
    
    @IBAction func doTapGuardar(_ sender: Any) {
        // Update Info
        contacto?.nombre = txtNombre.text
        contacto?.telefono? = (txtTelefono.text! as NSString).integerValue
        contacto?.direccion = txtDireccion.text
        contacto?.correo = txtCorreo.text
        
        // Reload Table
        callbackActualizarTabla!()
        
        // Pop View
        self.navigationController?.popViewController(animated: true)
    }
}
