package lesson4.com.vti.entity;

public class Position {
    public enum PositionName {
        DEV, TEST, SCRUMMASTER, PM;
    }
    int positionId;
    PositionName positionName;
}
