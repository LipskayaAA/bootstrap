package com.gaik.springbootsecurity.controller;

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
import java.util.List;
import java.util.stream.Collectors;

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
    public String printTable(Model model) {
        List<User> userList = userService.getAllUsers();
        model.addAttribute("userList", userList);
        return "admin";
    }

    @PostMapping("/admin")
    public String addUser(@ModelAttribute("user") User user,
                          @RequestParam(name = "roleNewUser", required = false) String roleNewUser
    ) {
        if (roleNewUser.compareTo("ROLE_USER") == 0) {
            user.setRoles(userService.getRoles()
                    .stream()
                    .filter(role -> role.getName().compareTo("ROLE_USER") == 0)
                    .collect(Collectors.toSet()));
        } else if (roleNewUser.compareTo("ROLE_ADMIN") == 0) {
            user.setRoles(userService.getRoles());
        }

        userService.saveUser(user);
        return "redirect:/admin";
    }

    @GetMapping("/admin/add")
    public String addUserForm(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("roles", new ArrayList<>(userService.getRoles()));
        return "add";
    }

    @GetMapping("/admin/update")
    public String updateUserForm(Model model, @RequestParam() Long id) {
        model.addAttribute("user", userService.findById(id));
        model.addAttribute("roles", new ArrayList<>(userService.getRoles()));
        return "update";
    }

    @GetMapping(value = "/admin/delete")
    public String deleteUserById(@RequestParam(required = false) Long id) {
        if (id != null) {
            userService.removeUserById(id);
        }
        return "redirect:/admin";
    }
}
