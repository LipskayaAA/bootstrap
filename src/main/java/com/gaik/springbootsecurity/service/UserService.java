package com.gaik.springbootsecurity.service;


import com.gaik.springbootsecurity.model.Role;
import com.gaik.springbootsecurity.model.User;

import java.util.List;
import java.util.Set;

public interface UserService {
    void saveUser(User user);

    void removeUserById(long id);

    List<User> getAllUsers();

    public void updateUserById(long id, String firstName, String lastName,
                               byte age, String email, String password, List<Role> roles);

    User findByUsername(String username);

    public User findById(long id);

    Set<Role> getRoles();
}
