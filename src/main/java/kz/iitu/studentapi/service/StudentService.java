package kz.iitu.studentapi.service;

import kz.iitu.studentapi.exception.StudentNotFoundException;
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
        return repository.findById(id).orElseThrow(() -> new StudentNotFoundException(id));
    }

    public Student create(Student student) {
        student.setId(null);
        return repository.save(student);
    }

    public Student update(Long id, Student data) {
        Student student = findById(id);
        student.setFirstName(data.getFirstName());
        student.setLastName(data.getLastName());
        student.setEmail(data.getEmail());
        student.setGroupName(data.getGroupName());
        return repository.save(student);
    }

    public void delete(Long id) {
        Student student = findById(id);
        repository.delete(student);
    }
}
