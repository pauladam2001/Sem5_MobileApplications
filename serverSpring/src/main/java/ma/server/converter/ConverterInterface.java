package ma.server.converter;

public interface ConverterInterface<Model, Dto>{
    Model DtoToModel(Dto dto);

    Dto ModelToDto(Model model);
}
