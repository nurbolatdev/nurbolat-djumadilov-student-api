package kz.iitu.studentapi.service;

import kz.iitu.studentapi.model.Student;
import kz.iitu.studentapi.repository.StudentRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {

    private final StudentRepository repository;

    public StudentService(StudentRepository repository) {
        this.repository = repository;
    }

    public List<Student> findAll() {
        return repository.findAll();
    }

    public Student findById(Long id) {
        return repository.findById(id).orElseThrow();
    }

    public Student create(Student student) {
        student.setId(null);
        return repository.save(student);
    }
}
