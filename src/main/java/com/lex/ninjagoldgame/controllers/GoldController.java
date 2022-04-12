package com.lex.ninjagoldgame.controllers;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GoldController {

	private static ArrayList<String> logs = new ArrayList<String>();

	@RequestMapping("/gold")
	public String index(HttpSession session) {
		if (session.getAttribute("gold") == null) {
			session.setAttribute("gold", 0);
		}
		return "index.jsp";
	}
	
	@RequestMapping("/process")
	public String process(HttpSession session,
						  Model model,
						  @RequestParam("chance") Integer chance,
						  @RequestParam("goldMin") Integer goldMin,
						  @RequestParam("goldMax") Integer goldMax,
						  @RequestParam("location") String location) {
		if (session.getAttribute("gold") == null) {
			session.setAttribute("gold", 0);
		}
		if (chance == 1) {
			Random rand = new Random();
			Integer randomGoldAmount = (Integer) rand.nextInt(goldMin, goldMax);
			Integer gold = (Integer) session.getAttribute("gold") + randomGoldAmount;
			session.setAttribute("gold", gold);
			String message = "You entered a " + location + " and earned " + randomGoldAmount + " gold.";
			logs.add(message);
			session.setAttribute("logs", logs);
		} else {
			Random rand = new Random();
			Integer passFail = rand.nextInt(2);
			if (passFail == 1) {
				Integer randomGoldAmount = (Integer) rand.nextInt(goldMin, goldMax);
				Integer gold = (Integer) session.getAttribute("gold") + randomGoldAmount;
				session.setAttribute("gold", gold);
				String message = "You completed a " + location + " and earned " + randomGoldAmount + " gold.";
				logs.add(message);
				session.setAttribute("logs", logs);
			} else {
				Integer randomGoldAmount = (Integer) rand.nextInt(goldMin, goldMax);
				Integer gold = (Integer) session.getAttribute("gold") - randomGoldAmount;
				session.setAttribute("gold", gold);
				String message = "You failed a " + location + " and lost " + randomGoldAmount + " gold.";
				logs.add(message);
				session.setAttribute("logs", logs);
			}
		}
		return "redirect:/gold";
	}
	
	@RequestMapping("/reset")
	public String reset(HttpSession session) {
		session.invalidate();
		logs = new ArrayList<String>();
		return "redirect:/gold";
	}
}