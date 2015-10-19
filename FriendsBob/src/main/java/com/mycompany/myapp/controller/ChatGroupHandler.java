package com.mycompany.myapp.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.Hashtable;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class ChatGroupHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory
			.getLogger(ChatGroupHandler.class);

	// Map<그룹이름, Hashtable<사용자이름, WebSocketSession>>
	private Map<String, Hashtable<String, WebSocketSession>> groupMap = new Hashtable<String, Hashtable<String, WebSocketSession>>();

	// 생성자
	public ChatGroupHandler() {
		groupMap.put("기본그룹", new Hashtable<String, WebSocketSession>());
	}

	// 연결이 되었을 때
	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		logger.info(session.getId() + " 연결 됨");
	}

	// 메시지가 도착했을 때
	@Override
	protected void handleTextMessage(WebSocketSession session,
			TextMessage message) throws Exception {
		logger.info(session.getId() + " 로 부터  받은 메시지: " + message.getPayload());
		JSONObject jsonObject = new JSONObject(message.getPayload());
		String command = jsonObject.getString("command");
		JSONObject data = jsonObject.getJSONObject("data");
		if (command.equals("addUser")) {
			addUser(data, session);
		} else if (command.equals("broadcast")) {
			broadcast(data);
		} else if (command.equals("addGroup")) {
			addGroup(data);
		} else if (command.equals("changeGroup")) {
			changeGroup(data, session);
		}
	}

	// 연결이 끊어졌을 때
	@Override
	public void afterConnectionClosed(WebSocketSession session,
			CloseStatus status) throws Exception {
		logger.info(session.getId() + " 연결 끊김");
		removeSession(session);
		sendGroupUserList();
	}

	// 그룹 추가
	private void addGroup(JSONObject data) throws IOException {
		String groupName = data.getString("groupName");
		groupMap.put(groupName, new Hashtable<String, WebSocketSession>());
		sendGroupUserList();
	}

	// 그룹 변경하기
	private void changeGroup(JSONObject data, WebSocketSession session)
			throws IOException {
		String groupName = data.getString("groupName");
		String userName = data.getString("userName");
		removeUser(userName);
		groupMap.get(groupName).put(userName, session);
		sendGroupUserList();
	}

	// 신규 사용자 추가
	private void addUser(JSONObject data, WebSocketSession session)
			throws IOException {
		String groupName = data.getString("groupName");
		String userName = data.getString("userName");
		groupMap.get(groupName).put(userName, session);
		sendGroupUserList();
	}

	// 지정한 그룹에 있는 사용자에게 메시지 보내기
	private void broadcast(JSONObject data) throws IOException {
		String groupName = data.getString("groupName");
		String chatText = data.getString("chatText");

		JSONObject response = new JSONObject();
		response.put("command", "appendChatText");
		JSONObject jsonData = new JSONObject();
		jsonData.put("chatText", chatText);
		response.put("data", jsonData);

		Collection<WebSocketSession> collection = groupMap.get(groupName)
				.values();
		for (WebSocketSession wss : collection) {
			wss.sendMessage(new TextMessage(response.toString()));
		}
	}

	// 모든 사용자에게 메시지 보내기
	private void broadcast(String message) throws IOException {
		Collection<Hashtable<String, WebSocketSession>> groupList = groupMap
				.values();
		for (Hashtable<String, WebSocketSession> group : groupList) {
			Collection<WebSocketSession> sessionList = group.values();
			for (WebSocketSession wss : sessionList) {
				wss.sendMessage(new TextMessage(message));
			}
		}
	}

	// 그룹내의 사용자이름 얻기
	private void sendGroupUserList() throws IOException {
		JSONObject response = new JSONObject();
		response.put("command", "refreshGroupUserList");
		JSONArray jsonData = new JSONArray();
		response.put("data", jsonData);
		Set<Entry<String, Hashtable<String, WebSocketSession>>> groupSet = groupMap
				.entrySet();
		for (Entry<String, Hashtable<String, WebSocketSession>> group : groupSet) {
			JSONObject jsonGroup = new JSONObject();
			jsonGroup.put("groupName", group.getKey());
			JSONArray jsonUserNames = new JSONArray();
			jsonGroup.put("userNames", jsonUserNames);
			Set<String> userNames = group.getValue().keySet();
			for (String userName : userNames) {
				jsonUserNames.put(userName);
			}
			jsonData.put(jsonGroup);
		}
		broadcast(response.toString());
	}

	// 사용자 제거하기
	private void removeUser(String userName) throws IOException {
		Collection<Hashtable<String, WebSocketSession>> groupList = groupMap
				.values();
		label: for (Hashtable<String, WebSocketSession> group : groupList) {
			Set<Entry<String, WebSocketSession>> groupEntrySet = group
					.entrySet();
			for (Entry<String, WebSocketSession> user : groupEntrySet) {
				if (user.getKey().equals(userName)) {
					group.remove(user.getKey());
					break label;
				}

			}
		}
	}

	private void removeSession(WebSocketSession session) throws IOException {
		Collection<Hashtable<String, WebSocketSession>> groupList = groupMap
				.values();
		label: for (Hashtable<String, WebSocketSession> group : groupList) {
			Set<Entry<String, WebSocketSession>> groupEntrySet = group
					.entrySet();
			for (Entry<String, WebSocketSession> user : groupEntrySet) {
				if (user.getValue() == session) {
					group.remove(user.getKey());
					break label;
				}
			}
		}
	}
}
