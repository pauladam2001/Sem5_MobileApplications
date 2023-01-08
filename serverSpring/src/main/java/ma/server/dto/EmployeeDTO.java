package ma.server.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class EmployeeDTO {
    private Long id;
    private String name;
    private Integer age;
    private String occupation;
    private Integer salary;
    private Integer experience;
}
