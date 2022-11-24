package com.gaik.springbootsecurity.controller;

import com.gaik.springbootsecurity.model.Role;
import com.gaik.springbootsecurity.model.User;
import com.gaik.springbootsecurity.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class UserController {

    @Autowired
    UserService userService;
    PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @GetMapping(value = "/user")
    public String userData(Principal principal, Model model) {
        model.addAttribute("user", userService.findByUsername(principal.getName()));
        return "user";
    }

    @GetMapping(value = "/admin")
    public String printTable(Model model, Principal principal) {
        List<User> userList = userService.getAllUsers();
        model.addAttribute("userList", userList);
        model.addAttribute("roles", new ArrayList<>(userService.getRoles()));
        model.addAttribute("newUser", new User());
        model.addAttribute("user", userService.findByUsername(principal.getName()));
        return "admin";
    }

    @PostMapping("/admin")
    public String addUser(@ModelAttribute("newUser") User newUser,
                          @RequestParam(name = "roleNewUser", required = false) List<String> roleNewUser
    ) {
        Set<Role> roleSet = new HashSet<>();
        for (String roleStr: roleNewUser) {
            roleSet.add(userService.getRoles()
                    .stream()
                    .filter(role -> role.getName().compareTo(roleStr) == 0)
                    .findFirst().get());
        }
        if (roleSet.isEmpty()) {
            roleSet = null;
        }
        newUser.setRoles(roleSet);

        System.out.println(newUser);

        userService.saveUser(newUser);
        return "redirect:/admin";
    }

    @PostMapping(value = "/admin/delete")
    public String deleteUserById(@RequestParam(required = false) Long id) {
        if (id != null) {
            userService.removeUserById(id);
        }
        return "redirect:/admin";
    }

//    @GetMapping("/admin/add")
//    public String addUserForm(Model model) {
//        model.addAttribute("user", new User());
//        model.addAttribute("roles", new ArrayList<>(userService.getRoles()));
//        return "newuser";
//    }

//    @GetMapping("/admin/update")
//    public String updateUserForm(Model model, @RequestParam() Long id) {
//        model.addAttribute("user", userService.findById(id));
//        model.addAttribute("roles", new ArrayList<>(userService.getRoles()));
//        return "update";
//    }
}
