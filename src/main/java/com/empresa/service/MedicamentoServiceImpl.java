
package com.empresa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.Medicamento;
import com.empresa.repository.MedicamentoRepository;

@Service
public class MedicamentoServiceImpl implements MedicamentoService{

	@Autowired
	MedicamentoRepository repository;

	@Override
	public Medicamento insertMedicament(Medicamento obj) {
		return repository.save(obj);
	}
	
	
	
}
