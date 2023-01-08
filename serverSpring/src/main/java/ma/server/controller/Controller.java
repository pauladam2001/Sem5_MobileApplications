package ma.server.controller;

import ma.server.converter.Converter;
import ma.server.dto.EmployeeDTO;
import ma.server.model.Employee;
import ma.server.repository.EmployeeRepository;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;
import java.util.Set;

@RestController
public class Controller {

    private final EmployeeRepository employeeRepository;
    private final Converter converter;

    public Controller(EmployeeRepository employeeRepository, Converter converter){
        this.employeeRepository = employeeRepository;
        this.converter = converter;
    }

    @GetMapping("/employees")
    public Set<EmployeeDTO> getAllEmployees(){
        System.out.println("employees");
        return converter.ModelsToDtos(employeeRepository.findAll());
    }

    @PostMapping("/employees")
    public Employee addEmployee(@RequestBody Employee employee){
        System.out.println("add employee");
        return employeeRepository.save(employee);
    }

    @DeleteMapping("/employees/{id}")
    public Employee deleteEmployee(@PathVariable long id){
        System.out.println("delete employee");
        Optional<Employee> tranOptional = employeeRepository.findById(id);

        if(tranOptional.isEmpty()){
            return null;
        }

        employeeRepository.deleteById(id);
        return tranOptional.get();
    }

    @PutMapping("/employees/{id}")
    public Employee updateEmployee(@PathVariable long id, @RequestBody Employee employee){
        System.out.println("update employee");
        Optional<Employee> tranOptional = employeeRepository.findById(id);

        if (tranOptional.isEmpty()){
            return null;
        }

        employee.setId(id);
        return employeeRepository.save(employee);
    }
}
