package com.cruid.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;

import com.cruid.AlertSuccess;
import com.cruid.exception.ResourceNotFoundException;
import com.cruid.model.*;
import com.cruid.repository.*;





@Controller
public class UserController {
	@Autowired private IUserRepository userRep;
	@Autowired private IUserStatusRepository userStatusRep;


	// LIST
	// --------------------
	@RequestMapping("/users")
    public String list(@PageableDefault(size = 2, sort = "id") Pageable pageable, Model model) {					
		model.addAttribute("userStatusList",  userStatusRep.findAll());	
		model.addAttribute("userList",  userRep.findAll(pageable));
		
		var sort = pageable.getSort().iterator().next();
		model.addAttribute("sortCol",  sort.getProperty().toString());
		model.addAttribute("sortDir",  sort.getDirection().toString());

        return "user/list";
    }

	
	// ITEM	
	// --------------------
	@GetMapping("/users/{id}")
    public String item(@PathVariable("id")Long id, Model model) {
		if(id == null || id <= 0) return "redirect:/users";
		
		model.addAttribute("user", userRep.getOne(id));
		model.addAttribute("userStatusList", userStatusRep.findAll());	
		return "user/item";
    }	
	

	// UPDATE
	// --------------------
	@PostMapping("/users/{id}")
    public String update(@PathVariable("id")Long id, @Valid User user, BindingResult valid, Model model, RedirectAttributes redirectAttrs) {      
		if(valid.hasErrors()) {
			model.addAttribute("userStatusList", userStatusRep.findAll());
			return "user/item";
		}

		userRep.save(user);	
		redirectAttrs.addFlashAttribute("alert", new AlertSuccess("Успех!", "Пользователь обновлен"));			
		return "redirect:/users/{id}";
    }

	
	
	// INSERT
	// --------------------	
	@GetMapping("/users/add")
    public String add(User user, Model model) {
		model.addAttribute("userStatusList", userStatusRep.findAll());	
		return "user/add";
    }	
	
	@PostMapping("/users/add")
    public String add(@Valid @ModelAttribute User user, BindingResult valid, Model model, RedirectAttributes redirectAttrs) {     
		if(valid.hasErrors()) {
			model.addAttribute("userStatusList", userStatusRep.findAll());
			return "user/add";
		}
				
		var u = userRep.save(user);		
		redirectAttrs.addFlashAttribute("alert", new AlertSuccess("Успех!", "Пользователь добавлен"));
		return "redirect:/users/" + u.getId();
    }	
	
	
	
	
	// DELETE - JSON RESPOND
	// --------------------		
	@PostMapping("/users/del/{id}")
	@ResponseBody
	public ResponseEntity<?> deleteQuestion(@PathVariable Long id) {	
		return userRep.findById(id).map(i -> {
			userRep.delete(i);
			return ResponseEntity.ok().build();
		}).orElseThrow(() -> new ResourceNotFoundException("Not found with id " + id));	
	}
}








