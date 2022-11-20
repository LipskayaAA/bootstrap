package com.gaik.springbootsecurity.service;

import com.gaik.springbootsecurity.dao.UserDao;
import com.gaik.springbootsecurity.model.Role;
import com.gaik.springbootsecurity.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

@Service
public class UserServiceImp implements UserService, UserDetailsService {

    @Autowired
    private UserDao userDao;

    @Transactional
    @Override
    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    @Transactional
    @Override
    public void removeUserById(long id) {
        userDao.removeUserById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    @Transactional
    @Override
    public void updateUserById(long id, String firstName, String lastName,
                               byte age, String email, String password, List<Role> roles) {
        userDao.updateUserById(id, firstName, lastName, age, email, password, roles);
    }

    @Transactional
    @Override
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }

    @Override
    public User findById(long id) {
        return userDao.findById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public Set<Role> getRoles() {
        return userDao.getRoles();
    }

    @Transactional
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        } else {
            return user;
        }
    }
}
