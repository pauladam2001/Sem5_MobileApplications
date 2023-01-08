package ma.server.converter;

import ma.server.dto.EmployeeDTO;
import ma.server.model.Employee;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.Set;
import java.util.stream.Collectors;

@Component
public class Converter implements ConverterInterface<Employee, EmployeeDTO> {

    public Set<EmployeeDTO> ModelsToDtos(Collection<Employee> models){
        return models.stream()
                .map(this::ModelToDto)// model -> ModelToDto(model)
                .collect(Collectors.toSet());
    }

    @Override
    public Employee DtoToModel(EmployeeDTO employeeDTO) {

        return new Employee(employeeDTO.getId(),
                employeeDTO.getName(),
                employeeDTO.getAge(),
                employeeDTO.getOccupation(),
                employeeDTO.getSalary(),
                employeeDTO.getExperience());
    }

    @Override
    public EmployeeDTO ModelToDto(Employee employee) {

        return new EmployeeDTO(employee.getId(),
                employee.getName(),
                employee.getAge(),
                employee.getOccupation(),
                employee.getSalary(),
                employee.getExperience());
    }
}
