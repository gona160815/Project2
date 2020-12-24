package main.java.hugo.test;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.web.socket.server.standard.SpringConfigurator;

import main.java.hugo.model.MemberBasic;


//websocket連線URL地址和可被呼叫配置
@ServerEndpoint(value="/chat/{userId}",configurator = SpringConfigurator.class)
public class WebSocketChat {
	
    //靜態變數，用來記錄當前線上連線數。應該把它設計成執行緒安全的。
    private static int onlineCount = 0;
   
    //記錄每個使用者下多個終端的連線
    private static Map<String, Set<WebSocketChat>> userSocket = new HashMap<>();
 
    //需要session來對使用者傳送資料, 獲取連線特徵userId
    private Session session;
    private String userId;
   
    /**
     * @Title: onOpen
     * @Description: websocekt連線建立時的操作
     * @param @param userId 使用者id
     * @param @param session websocket連線的session屬性
     * @param @throws IOException
     */
    @OnOpen
    public void onOpen(@PathParam("userId") String userId,Session session) throws IOException{
        this.session = session;
        this.userId = userId;
        onlineCount++;
        //根據該使用者當前是否已經在別的終端登入進行新增操作
        if (userSocket.containsKey(this.userId)) {
            userSocket.get(this.userId).add(this); //增加該使用者set中的連線例項
        }else {
            Set<WebSocketChat> addUserSet = new HashSet<>();
            addUserSet.add(this);
            userSocket.put(this.userId, addUserSet);
        }
    }
   
    /**
     * @Title: onClose
     * @Description: 連線關閉的操作
     */
    @OnClose
    public void onClose(){
        //移除當前使用者終端登入的websocket資訊,如果該使用者的所有終端都下線了，則刪除該使用者的記錄
        if (userSocket.get(this.userId).size() == 0) {
            userSocket.remove(this.userId);
        }else{
            userSocket.get(this.userId).remove(this);
        }
    }
   
    /**
     * @Title: onMessage
     * @Description: 收到訊息後的操作
     * @param @param message 收到的訊息
     * @param @param session 該連線的session屬性
     */
    @OnMessage
    public void onMessage(String message, Session session) {    
        //測試向客戶端傳送訊息傳送
        sendMessageToUser(this.userId,/*"伺服器收到你的訊息："+*/ message);//這裡不需要
    }
   
    /**
     * @Title: onError
     * @Description: 連線發生錯誤時候的操作
     * @param @param session 該連線的session
     * @param @param error 發生的錯誤
     */
    @OnError
    public void onError(Session session, Throwable error){
        error.printStackTrace();
    }
   
  /**
   * @Title: sendMessageToUser
   * @Description: 傳送訊息給使用者下的所有終端
   * @param @param userId 使用者id
   * @param @param message 傳送的訊息
   * @param @return 傳送成功返回true，反則返回false
   */
    public Boolean sendMessageToUser(String userId,String message){
        if (userSocket.containsKey(userId)) {
            for (WebSocketChat WS : userSocket.get(userId)) {
                try {
                    WS.session.getBasicRemote().sendText(message);
                } catch (IOException e) {
                    e.printStackTrace();
                    return false;
                }
            }
            return true;
        }
        return false;
    }
  
}