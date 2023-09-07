package com.empresa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.empresa.entity.Concurso;

@Repository
public interface ConcursoRepository  extends JpaRepository<Concurso, Integer>{
		
}
