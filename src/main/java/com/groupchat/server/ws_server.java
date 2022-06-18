package com.groupchat.server;

import java.io.IOException;
import java.util.Calendar;
import java.util.Formatter;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONObject;

@ServerEndpoint("/websocketendpoint")
public class ws_server {
    private Session ts;
    private String user;
    int  count=1;
      
    @OnOpen
    public void onOpen( Session ts) throws IOException{
        this.ts=ts;
        
        for (@SuppressWarnings("unused") Session os : this.ts.getOpenSessions())
            count+=1;
        System.out.println("Open Connection ...");
    }
     
    @OnClose
    public void onClose(){
        System.out.println("Close Connection ...");
    }
     
    @OnMessage
    public void onMessage(String message , Session ses)throws IOException {
    	JSONObject obj = new JSONObject(message);
        System.out.println("Connection for message ...");
        Calendar gfg_calender = Calendar.getInstance(); 
        Formatter f = new Formatter();
        for (Session os : this.ts.getOpenSessions()){
            if (!os.equals(this.ts)){
                RemoteEndpoint.Basic remote = os.getBasicRemote();
                remote.sendText(obj.get("username")+"("+f.format("%tl:%tM", gfg_calender,gfg_calender)+"):"+obj.get(("message")));
            }
        }
        f.close();
    }
 
    @OnError
    public void onError(Throwable e){
        e.printStackTrace();
    }
    

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}
    
    
}