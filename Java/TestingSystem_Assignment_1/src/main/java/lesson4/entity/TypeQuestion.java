package lesson4.com.vti.entity;

public class TypeQuestion {
    public enum TypeName{
        ESSAY, MULTIPLECHOICE;
    }
    int typeId;
    TypeName typeName;
}
