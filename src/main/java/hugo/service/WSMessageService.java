package main.java.hugo.service;

import org.springframework.stereotype.Service;

import main.java.hugo.test.WebSocketChat;



@Service("webSocketMessageService")
public class WSMessageService {
    //宣告websocket連線類
    private WebSocketChat webSocketChat = new WebSocketChat();

    /**
     * @Title: sendToAllTerminal
     * @Description: 呼叫websocket類給使用者下的所有終端傳送訊息
     * @param @param userId 使用者id
     * @param @param message 訊息
     * @param @return 傳送成功返回true，否則返回false
     */
    public Boolean sendToAllTerminal(String userId,String message){   
        if(webSocketChat.sendMessageToUser(userId,message)){
            return true;
        }else{
            return false;
        }   
    }           
}
