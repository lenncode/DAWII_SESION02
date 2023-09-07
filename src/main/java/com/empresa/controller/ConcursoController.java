package com.empresa.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.empresa.entity.Concurso;
import com.empresa.service.ConcursoService;

@Controller
public class ConcursoController {

	@Autowired
	ConcursoService service;

	@GetMapping(value = "/verConcurso")
	public String ver() {
		return "registraConcurso";
	}

	@PostMapping(value = "/insertarConcurso")
	public ResponseEntity<?> insertarConcurso(Concurso objConcurso) {

		HashMap<String, String> salida = new HashMap<>();
		Concurso objSalida = service.insertConcurso(objConcurso);
		salida.put("MENSAJE", "OCURRIO UN ERROR");

		if (objSalida != null)
			salida.put("MENSAJE", "REGISTRO EXITOSO");

		return ResponseEntity.ok(salida);
	}

}
