package model;

import java.util.HashMap;
import java.util.Map;

public class MockData {
    private static Map<String, User> users = new HashMap<>();

    static {
        
        users.put("admin@movie369.com", new User("admin", "123", "admin@movie369.com"));
        users.put("thanh@gmail.com",    new User("thanh", "123456", "thanh@gmail.com"));
        users.put("guest@test.com",     new User("guest", "1", "guest@test.com"));
    }

    public static User checkLogin(String email, String password) {
        if (users.containsKey(email)) {
            User u = users.get(email);
            if (u.getPassword().equals(password)) {
                return u;
            }
        }
        return null;
    }
}