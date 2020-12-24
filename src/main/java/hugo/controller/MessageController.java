package main.java.hugo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import main.java.hugo.service.WSMessageService;


@Controller
@RequestMapping("/message")
public class MessageController {
	
    
    @Autowired
    private WSMessageService wsMessageService;

  //service wit this
    @RequestMapping(value="/TestWS",method=RequestMethod.GET)
    @ResponseBody
    public String TestWS(@RequestParam(value="userId",required=true) String userId,
        @RequestParam(value="message",required=true) String message){
    	Boolean sendToAllTerminal = wsMessageService.sendToAllTerminal(userId, message);
		return message;
    }
    
    
}
    	


          
                      
        

