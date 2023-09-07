package com.empresa.controller;

import java.util.HashMap;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.empresa.entity.Medicamento;
import com.empresa.service.MedicamentoService;

@Controller
public class MedicamentoController {

	@Autowired
	MedicamentoService service;

	@GetMapping(value = "/verMedicamento")
	public String ver() {
		return "registraMedicamentoVal";
	}
	
	@GetMapping(value = "/verMedicamentoBootstrap5")
	public String verBootstrap5() {
		return "registraMedicamento";
	}

	@PostMapping(value = "/insertarMedicamento")
	public ResponseEntity<?> insertarMedicamento(Medicamento objMedicamento) {

		HashMap<String, String> salida = new HashMap<>();
		Medicamento objSalida = service.insertMedicament(objMedicamento);
		salida.put("MENSAJE", "OCURRIO UN ERROR");

		if (objSalida != null)
			salida.put("MENSAJE", "Registro Exitoso");

		return ResponseEntity.ok(salida);
	}

}
