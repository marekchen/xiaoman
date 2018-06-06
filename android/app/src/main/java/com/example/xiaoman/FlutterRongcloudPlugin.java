package com.example.xiaoman;

import android.net.Uri;
import android.util.Log;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.rong.imlib.IRongCallback;
import io.rong.imlib.RongIMClient;
import io.rong.imlib.model.Conversation;
import io.rong.imlib.model.Message;
import io.rong.message.FileMessage;
import io.rong.message.ImageMessage;
import io.rong.message.LocationMessage;
import io.rong.message.RecallNotificationMessage;
import io.rong.message.TextMessage;

public class FlutterRongcloudPlugin implements MethodCallHandler, StreamHandler {

    private final static String TAG = "FlutterRongcloudPlugin";

    @Override
    public void onMethodCall(MethodCall methodCall, final Result result) {
        switch (methodCall.method) {
            case "connect":
                connect(methodCall, result);
                break;
            case "disconnect":
                disconnect(methodCall, result);
                break;
            case "logout":
                logout(methodCall, result);
                break;
            case "sendMessage":

                break;
            case "sendLocationMessage":
                sendLocationMessage(methodCall, result);
                break;
            case "sendImageMessage":

                break;
            case "sendMediaMessage":

                break;
            case "insertMessage":
                // TODO
                break;
            case "clearMessages":
                clearMessages(methodCall, result);
                break;
            case "deleteMessages":
                RongIMClient.getInstance().logout();
                break;
            case "getHistoryMessages":
                RongIMClient.getInstance().logout();
                break;
            case "getRemoteHistoryMessages":
                RongIMClient.getInstance().logout();
                break;
            case "searchConversations":
                RongIMClient.getInstance().logout();
                break;
            case "searchMessages":
                RongIMClient.getInstance().logout();
                break;
            case "setOnReceiveMessageListener":
                RongIMClient.getInstance().logout();
                break;
            case "clearMessagesUnreadStatus":
                RongIMClient.getInstance().logout();
                break;
            case "setMessageReceivedStatus":
                RongIMClient.getInstance().logout();
                break;
            case "getConversation":
                getConversation(methodCall, result);
                break;
            case "getConversationList":
                getConversationList(methodCall, result);
                break;
            case "getConversationListByPage":
                RongIMClient.getInstance().logout();
                break;
            case "removeConversation":
                RongIMClient.getInstance().logout();
                break;
            case "getConversationNotificationStatus":
                RongIMClient.getInstance().logout();
                break;
            case "setConversationNotificationStatus":
                RongIMClient.getInstance().logout();
                break;
            case "setNotificationQuietHours":
                RongIMClient.getInstance().logout();
                break;
            case "removeNotificationQuietHours":
                RongIMClient.getInstance().logout();
                break;
            case "saveTextMessageDraft":
                RongIMClient.getInstance().logout();
                break;
            case "getTextMessageDraft":
                RongIMClient.getInstance().logout();
                break;
            case "setConversationToTop":
                RongIMClient.getInstance().logout();
                break;
            case "getTotalUnreadCount":
                RongIMClient.getInstance().logout();
                break;
            case "getUnreadCount":
                RongIMClient.getInstance().logout();
                break;
            case "addToBlacklist":
                RongIMClient.getInstance().logout();
                break;
            case "removeFromBlacklist":
                RongIMClient.getInstance().logout();
                break;
            case "getBlacklistStatus":
                RongIMClient.getInstance().logout();
                break;
            case "getBlacklist":
                RongIMClient.getInstance().logout();
                break;
            case "joinChatRoom":
                RongIMClient.getInstance().logout();
                break;
            case "joinExistChatRoom":
                RongIMClient.getInstance().logout();
                break;
            case "quitChatRoom":
                RongIMClient.getInstance().logout();
                break;
            case "getChatRoomInfo":
                RongIMClient.getInstance().logout();
                break;
            case "getChatroomHistoryMessages":
                RongIMClient.getInstance().logout();
                break;
            case "getMentionedCount":
                RongIMClient.getInstance().logout();
                break;
            case "getUnreadMentionedMessages":
                RongIMClient.getInstance().logout();
                break;
            case "recallMessage":
                RongIMClient.getInstance().logout();
                break;
            case "setRecallMessageListener":
                RongIMClient.getInstance().logout();
                break;
            case "sendReadReceiptMessage":
                RongIMClient.getInstance().logout();
                break;
            case "setReadReceiptListener":
                RongIMClient.getInstance().logout();
                break;
            case "sendReadReceiptRequest":
                RongIMClient.getInstance().logout();
                break;
            case "sendReadReceiptResponse":
                RongIMClient.getInstance().logout();
                break;
            case "syncConversationReadStatus":
                RongIMClient.getInstance().logout();
                break;
            case "setSyncConversationReadStatusListener":
                RongIMClient.getInstance().logout();
                break;
            case "sendTypingStatus":
                RongIMClient.getInstance().logout();
                break;
            case "setTypingStatusListener":
                RongIMClient.getInstance().logout();
                break;
            case "setRCLogInfoListener":
                RongIMClient.getInstance().logout();
                break;
            case "getRealTimeLocation":
                RongIMClient.getInstance().logout();
                break;
            case "startRealTimeLocation":
                RongIMClient.getInstance().logout();
                break;
            case "joinRealTimeLocation":
                RongIMClient.getInstance().logout();
                break;
            case "quitRealTimeLocation":
                RongIMClient.getInstance().logout();
                break;
            case "getRealTimeLocationParticipants":
                RongIMClient.getInstance().logout();
                break;
            case "getRealTimeLocationCurrentState":
                RongIMClient.getInstance().logout();
                break;
            case "addRealTimeLocationListener":
                RongIMClient.getInstance().logout();
                break;
            case "removeRealTimeLocationObserver":
                RongIMClient.getInstance().logout();
                break;
        }
    }

    private void connect(MethodCall methodCall, final Result result) {
        String token = methodCall.argument("token");
        Log.i(TAG, "token:" + token);
        RongIMClient.connect(token, new RongIMClient.ConnectCallback() {
            @Override
            public void onTokenIncorrect() {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 1);
                re.put("ErrorInfo", "onTokenIncorrect");
                result.success(re);
            }

            @Override
            public void onSuccess(String s) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("ErrorInfo", s);
                result.success(re);
            }

            @Override
            public void onError(RongIMClient.ErrorCode errorCode) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                Log.i(TAG, "error:" + errorCode.toString());
                result.success(re);
            }
        });
    }

    private void disconnect(MethodCall methodCall, final Result result) {
        RongIMClient.getInstance().disconnect();
    }

    private void logout(MethodCall methodCall, final Result result) {
        RongIMClient.getInstance().logout();
    }

    private void getConversation(MethodCall methodCall, final Result result) {
        int conversationType = methodCall.argument("conversationType");
        String targetId = methodCall.argument("targetId");
        RongIMClient.getInstance().getConversation(Conversation.ConversationType.setValue(conversationType), targetId, new RongIMClient.ResultCallback<Conversation>() {
            @Override
            public void onSuccess(Conversation conversation) {

            }

            @Override
            public void onError(RongIMClient.ErrorCode errorCode) {

            }
        });
    }

    private void getConversationList(MethodCall methodCall, final Result result) {
        RongIMClient.getInstance().getConversationList(new RongIMClient.ResultCallback<List<Conversation>>() {
            @Override
            public void onSuccess(List<Conversation> conversations) {

            }

            @Override
            public void onError(RongIMClient.ErrorCode errorCode) {

            }
        });
    }

    private void sendLocationMessage(MethodCall methodCall, final Result result) {
        double lat = methodCall.argument("lat");
        double lng = methodCall.argument("lng");
        String poi = methodCall.argument("poi");
        Uri imgUri = null;
        LocationMessage locationMessage = LocationMessage.obtain(lat, lng, poi, imgUri);
        String targetId2 = "";
        String pushContent2 = null;
        String pushData2 = null;
        Message myMessage2 = Message.obtain(targetId2, Conversation.ConversationType.PRIVATE, locationMessage);
        RongIMClient.getInstance().sendLocationMessage(myMessage2, pushContent2, pushData2, new IRongCallback.ISendMessageCallback() {
            @Override
            public void onAttached(Message message) {
                // 消息成功存到本地数据库的回调
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 1);
                re.put("ErrorInfo", "onAttached");
                result.success(re);
            }

            @Override
            public void onSuccess(Message message) {
                // 消息发送成功的回调
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("ErrorInfo", "onSuccess");
                re.put("Message", message);
                result.success(re);
            }

            @Override
            public void onError(Message message, RongIMClient.ErrorCode errorCode) {
                // 消息发送失败的回调
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                result.success(re);
            }
        });
    }


    private void clearMessages(MethodCall methodCall, final Result result) {
        String targetId5 = methodCall.argument("targetId");
        RongIMClient.getInstance().clearMessages(Conversation.ConversationType.PRIVATE, targetId5, new RongIMClient.ResultCallback<Boolean>() {
            @Override
            public void onSuccess(Boolean aBoolean) {
                result.success(aBoolean);
            }

            @Override
            public void onError(RongIMClient.ErrorCode errorCode) {

            }
        });
    }

    @Override
    public void onListen(Object arguments, final EventSink eventSink) {
        Log.i(TAG, "onListen");
        switch ((String) argument(arguments, "method")) {
            case "sendMessage":
                sendMessage(arguments, eventSink);
                break;
            case "sendImageMessage":
                sendImageMessage(arguments, eventSink);
                break;
            case "sendMediaMessage":
                sendMediaMessage(arguments, eventSink);
                break;
        }
    }

    @Override
    public void onCancel(Object arguments) {

    }

    private Map<String, Object> messageToMap(Message message) {
        Map<String, Object> map = new HashMap<>();
        map.put("targetId", message.getTargetId());
        map.put("conversationType", message.getConversationType().getValue());
        Map<String, Object> content = null;
        switch (message.getObjectName()) {
            case "RC:TxtMsg":
                content = textMessageToMap((TextMessage) message.getContent());
                break;
            case "RC:ImgMsg":
                content = imageMessageToMap((ImageMessage) message.getContent());
                break;
            case "RC:VcMsg":
                content = imageMessageToMap((ImageMessage) message.getContent());
                break;
            case "RC:FileMsg":
                content = fileMessageToMap((FileMessage) message.getContent());
                break;
            case "RC:RcNtf":
                //content = fileMessageToMap((RecallNotificationMessage) message.getContent());
                break;
        }
        if (content != null) {
            map.put("content", content);
        }
        map.put("messageId", message.getMessageId());
        if (message.getSenderUserId() != null) {
            map.put("senderUserId", message.getSenderUserId());
        }
        if (message.getMessageDirection() != null) {
            map.put("messageDirection", message.getMessageDirection().getValue());
        }
        if (message.getObjectName() != null) {
            map.put("objectName", message.getObjectName());
        }
        map.put("sentTime", message.getSentTime());
        map.put("receivedTime", message.getReceivedTime());
        return map;
    }

    private Map<String, Object> textMessageToMap(TextMessage message) {
        Map<String, Object> map = new HashMap<>();
        map.put("content", message.getContent());
        return map;
    }

    private Map<String, Object> imageMessageToMap(ImageMessage message) {
        Map<String, Object> map = new HashMap<>();
        if (message.getMediaUrl() != null) {
            map.put("mediaUrl", message.getMediaUrl().toString());
        }
        if (message.getRemoteUri() != null) {
            map.put("remoteUri", message.getRemoteUri().toString());
        }
        if (message.getThumUri() != null) {
            map.put("thumbUri", message.getThumUri().toString());
        }
        if (message.getLocalUri() != null) {
            map.put("localUri", message.getLocalUri().toString());
        }
        map.put("isFull", message.isFull());
        return map;
    }

    private Map<String, Object> fileMessageToMap(FileMessage message) {
        Map<String, Object> map = new HashMap<>();
        if (message.getMediaUrl() != null) {
            map.put("mediaUrl", message.getMediaUrl().toString());
        }
        if (message.getLocalPath() != null) {
            map.put("localUri", message.getLocalPath().toString());
        }
        return map;
    }

    private void sendMessage(Object arguments, final EventSink eventSink) {
        String targetId = (String) argument(arguments, "targetId");
        String pushContent = (String) argument(arguments, "pushContent");
        String pushData = (String) argument(arguments, "pushData");
        int conversationType = (int) argument(arguments, "conversationType");

        Map<String, Object> content = (Map<String, Object>) argument(arguments, "content");
        String text = (String) content.get("content");
        TextMessage myTextMessage = TextMessage.obtain(text);
        Message myMessage = Message.obtain(targetId, Conversation.ConversationType.setValue(conversationType), myTextMessage);
        RongIMClient.getInstance().sendMessage(myMessage, pushContent, pushData, new IRongCallback.ISendMessageCallback() {
            @Override
            public void onAttached(Message message) {
                Log.i(TAG, "onAttached");
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 1);
                re.put("ErrorInfo", "onAttached");
                eventSink.success(re);
            }

            @Override
            public void onSuccess(Message message) {
                Log.i(TAG, "onSuccess");
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("ErrorInfo", "onSuccess");
                re.put("Message", messageToMap(message));
                eventSink.success(re);
            }

            @Override
            public void onError(Message message, RongIMClient.ErrorCode errorCode) {
                Log.i(TAG, "onError");
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                eventSink.success(re);
            }
        });
    }

    private void sendImageMessage(Object arguments, final EventSink eventSink) {
        String targetId = (String) argument(arguments, "targetId");
        String pushContent = (String) argument(arguments, "pushContent");
        String pushData = (String) argument(arguments, "pushData");
        int conversationType = (int) argument(arguments, "conversationType");

        Map<String, Object> content = (Map<String, Object>) argument(arguments, "content");
        Log.i(TAG, "content:" + content.toString());
        boolean isFull = (boolean) content.get("isFull");
        Uri thumbUri = Uri.parse((String) content.get("thumbUri"));
        Uri localUri = Uri.parse((String) content.get("localUri"));
        ImageMessage imageMessage = ImageMessage.obtain(thumbUri, localUri, isFull);
        Message myMessage3 = Message.obtain(targetId, Conversation.ConversationType.setValue(conversationType), imageMessage);
        RongIMClient.getInstance().sendImageMessage(myMessage3, pushContent, pushData, new RongIMClient.SendImageMessageCallback() {

            @Override
            public void onAttached(Message message) {
                Log.i(TAG, "onAttached");
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 1);
                re.put("ErrorInfo", "onAttached");
                eventSink.success(re);
            }

            @Override
            public void onError(Message message, RongIMClient.ErrorCode errorCode) {
                Log.i(TAG, "onError");
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                eventSink.success(re);
            }

            @Override
            public void onSuccess(Message message) {
                ImageMessage im = (ImageMessage) message.getContent();
                Log.i(TAG, "onSuccess:" + im.getMediaUrl());
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("ErrorInfo", "onSuccess");
                re.put("Message", messageToMap(message));
                eventSink.success(re);
            }

            @Override
            public void onProgress(Message message, int i) {
                Log.i(TAG, "onProgress");
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 2);
                re.put("Progress", i);
                re.put("ErrorInfo", "onProgress");
                eventSink.success(re);
            }
        });
    }

    private void sendMediaMessage(Object arguments, final EventSink eventSink) {
        String targetId = (String) argument(arguments, "targetId");
        String pushContent = (String) argument(arguments, "pushContent");
        String pushData = (String) argument(arguments, "pushData");
        int conversationType = (int) argument(arguments, "conversationType");

        Map<String, Object> content = (Map<String, Object>) argument(arguments, "content");
        Log.i(TAG, "content:" + content.toString());
        Uri localUri = Uri.parse((String) content.get("localUri"));

        FileMessage fileMessage = FileMessage.obtain(localUri);
        Message message4 = Message.obtain(targetId, Conversation.ConversationType.setValue(conversationType), fileMessage);
        RongIMClient.getInstance().sendMediaMessage(message4, pushContent, pushData, new IRongCallback.ISendMediaMessageCallback() {

            @Override
            public void onAttached(Message message) {
                Log.i(TAG, "onAttached");
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 1);
                re.put("ErrorInfo", "onAttached");
                eventSink.success(re);
            }

            @Override
            public void onError(Message message, RongIMClient.ErrorCode errorCode) {
                Log.i(TAG, "onError");
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                eventSink.success(re);
            }

            @Override
            public void onSuccess(Message message) {
                Log.i(TAG, "onSuccess");
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("ErrorInfo", "onSuccess");
                re.put("Message", messageToMap(message));
                eventSink.success(re);
            }

            @Override
            public void onProgress(Message message, int i) {
                Log.i(TAG, "onProgress:" + i);
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 2);
                re.put("Progress", i);
                re.put("ErrorInfo", "onProgress");
                eventSink.success(re);
            }

            @Override
            public void onCanceled(Message message) {
                Log.i(TAG, "onCanceled");
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 3);
                re.put("ErrorInfo", "onCanceled");
                eventSink.success(re);
            }
        });
    }

    private Object argument(Object arguments, String key) {
        if (arguments == null) {
            return null;
        } else if (arguments instanceof Map) {
            return ((Map) arguments).get(key);
        } else if (arguments instanceof JSONObject) {
            return ((JSONObject) arguments).opt(key);
        } else {
            throw new ClassCastException();
        }
    }
}
