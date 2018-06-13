package com.example.xiaoman;

import android.net.Uri;
import android.util.Log;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.rong.imlib.IRongCallback;
import io.rong.imlib.RongIMClient;
import io.rong.imlib.RongIMClient.ErrorCode;
import io.rong.imlib.RongIMClient.ResultCallback;
import io.rong.imlib.RongIMClient.OperationCallback;
import io.rong.imlib.RongIMClient.SendImageMessageCallback;
import io.rong.imlib.model.Conversation;
import io.rong.imlib.model.Conversation.ConversationType;
import io.rong.imlib.model.Message;
import io.rong.message.FileMessage;
import io.rong.message.ImageMessage;
import io.rong.message.LocationMessage;
import io.rong.message.RecallNotificationMessage;
import io.rong.message.TextMessage;
import io.rong.message.VoiceMessage;

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
            case "insertMessage":
                // NO
                break;
            case "clearMessages":
                clearMessages(methodCall, result);
                break;
            case "deleteMessages":
                deleteMessages(methodCall, result);
                break;
            case "getHistoryMessages":
                getHistoryMessages(methodCall, result);
                break;
            case "getRemoteHistoryMessages":
                // NO
                break;
            case "searchConversations":
                // NO
                break;
            case "searchMessages":
                // NO
                break;
            case "clearMessagesUnreadStatus":
                clearMessagesUnreadStatus(methodCall, result);
                break;
            case "setMessageReceivedStatus":
                setMessageReceivedStatus(methodCall, result);
                break;
            case "getConversation":
                getConversation(methodCall, result);
                break;
            case "getConversationList":
                getConversationList(methodCall, result);
                break;
            case "getConversationListByPage":
                getConversationListByPage(methodCall, result);
                break;
            case "removeConversation":
                removeConversation(methodCall, result);
                break;
            case "getConversationNotificationStatus":
                getConversationNotificationStatus(methodCall, result);
                break;
            case "setConversationNotificationStatus":
                setConversationNotificationStatus(methodCall, result);
                break;
            case "setNotificationQuietHours":
                setNotificationQuietHours(methodCall, result);
                break;
            case "removeNotificationQuietHours":
                removeNotificationQuietHours(methodCall, result);
                break;
            case "saveTextMessageDraft":
                saveTextMessageDraft(methodCall, result);
                break;
            case "getTextMessageDraft":
                getTextMessageDraft(methodCall, result);
                break;
            case "setConversationToTop":
                // TODO
                break;
            case "getTotalUnreadCount":
                // TODO
                break;
            case "getUnreadCount":
                // TODO
                break;
            case "addToBlacklist":
                // TODO
                break;
            case "removeFromBlacklist":
                // TODO
                break;
            case "getBlacklistStatus":
                // TODO
                break;
            case "getBlacklist":
                // TODO
                break;
            case "joinChatRoom":
                // TODO
                break;
            case "joinExistChatRoom":
                // TODO
                break;
            case "quitChatRoom":
                // TODO
                break;
            case "getChatRoomInfo":
                // TODO
                break;
            case "getChatroomHistoryMessages":
                // NO
                break;
            case "getMentionedCount":
                // NO
                break;
            case "getUnreadMentionedMessages":
                // NO
                break;
            case "recallMessage":
                // NO
                break;
            case "setRecallMessageListener":
                // NO
                break;
            case "sendReadReceiptMessage":
                // NO
                break;
            case "setReadReceiptListener":
                // NO
                break;
            case "sendReadReceiptRequest":
                // NO
                break;
            case "sendReadReceiptResponse":
                // NO
                break;
            case "syncConversationReadStatus":
                // NO
                break;
            case "setSyncConversationReadStatusListener":
                // NO
                break;
            case "sendTypingStatus":
                // NO
                break;
            case "setTypingStatusListener":
                // NO
                break;
            case "setRCLogInfoListener":
                // NO
                break;
            case "getRealTimeLocation":
                // NO
                break;
            case "startRealTimeLocation":
                // NO
                break;
            case "joinRealTimeLocation":
                // NO
                break;
            case "quitRealTimeLocation":
                // NO
                break;
            case "getRealTimeLocationParticipants":
                // NO
                break;
            case "getRealTimeLocationCurrentState":
                // NO
                break;
            case "addRealTimeLocationListener":
                // NO
                break;
            case "removeRealTimeLocationObserver":
                // NO
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
            public void onError(ErrorCode errorCode) {
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

    private void clearMessagesUnreadStatus(MethodCall methodCall, final Result result) {
        int conversationType = methodCall.argument("conversationType");
        String targetId = methodCall.argument("targetId");
        Long timestamp = methodCall.argument("timestamp");
        Log.i(TAG, "timestamp:" + timestamp);
        if (timestamp != null) {
            RongIMClient.getInstance().clearMessagesUnreadStatus(ConversationType.setValue(conversationType), targetId, timestamp, new OperationCallback() {
                @Override
                public void onSuccess() {
                    Map<String, Object> re = new HashMap<>();
                    re.put("Code", 0);
                    re.put("Result", true);
                    result.success(re);
                }

                @Override
                public void onError(ErrorCode errorCode) {
                    Map<String, Object> re = new HashMap<>();
                    re.put("Code", -1);
                    re.put("ErrorCode", errorCode.getValue());
                    re.put("ErrorInfo", errorCode.getMessage());
                    Log.i(TAG, "error:" + errorCode.toString());
                    result.success(re);
                }
            });
        } else {
            RongIMClient.getInstance().clearMessagesUnreadStatus(ConversationType.setValue(conversationType), targetId, new ResultCallback<Boolean>() {
                @Override
                public void onSuccess(Boolean aBoolean) {
                    Map<String, Object> re = new HashMap<>();
                    re.put("Code", 0);
                    re.put("Result", aBoolean);
                    result.success(re);
                }

                @Override
                public void onError(ErrorCode errorCode) {
                    Map<String, Object> re = new HashMap<>();
                    re.put("Code", -1);
                    re.put("ErrorCode", errorCode.getValue());
                    re.put("ErrorInfo", errorCode.getMessage());
                    Log.i(TAG, "error:" + errorCode.toString());
                    result.success(re);
                }
            });
        }
    }

    private void setMessageReceivedStatus(MethodCall methodCall, final Result result) {
        int messageId = methodCall.argument("messageId");
        int receivedStatus = methodCall.argument("receivedStatus");
        RongIMClient.getInstance().setMessageReceivedStatus(messageId, new Message.ReceivedStatus(receivedStatus), new ResultCallback<Boolean>() {
            @Override
            public void onSuccess(Boolean aBoolean) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("Result", aBoolean);
                result.success(re);
            }

            @Override
            public void onError(ErrorCode errorCode) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                Log.i(TAG, "error:" + errorCode.toString());
                result.success(re);
            }
        });
    }

    private void getConversation(MethodCall methodCall, final Result result) {
        int conversationType = methodCall.argument("conversationType");
        String targetId = methodCall.argument("targetId");
        RongIMClient.getInstance().getConversation(ConversationType.setValue(conversationType), targetId, new ResultCallback<Conversation>() {
            @Override
            public void onSuccess(Conversation conversation) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("Result", conversation);
                result.success(re);
            }

            @Override
            public void onError(ErrorCode errorCode) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                Log.i(TAG, "error:" + errorCode.toString());
                result.success(re);
            }
        });
    }

    private void getConversationList(MethodCall methodCall, final Result result) {
        List<Integer> conversationTypes1 = methodCall.argument("conversationTypes");
        ConversationType[] conversationTypes2 = convertConversationTypes(conversationTypes1);
        RongIMClient.getInstance().getConversationList(new ResultCallback<List<Conversation>>() {
            @Override
            public void onSuccess(List<Conversation> conversations) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("Result", conversations);
                result.success(re);
            }

            @Override
            public void onError(ErrorCode errorCode) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                Log.i(TAG, "error:" + errorCode.toString());
                result.success(re);
            }
        }, conversationTypes2);
    }

    private void getConversationListByPage(MethodCall methodCall, final Result result) {
        List<Integer> conversationTypes1 = methodCall.argument("conversationTypes");
        ConversationType[] conversationTypes2 = convertConversationTypes(conversationTypes1);
        long timeStamp = methodCall.argument("timeStamp");
        int count = methodCall.argument("count");
        RongIMClient.getInstance().getConversationListByPage(new ResultCallback<List<Conversation>>() {
            @Override
            public void onSuccess(List<Conversation> conversations) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("Result", conversations);
                result.success(re);
            }

            @Override
            public void onError(ErrorCode errorCode) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                Log.i(TAG, "error:" + errorCode.toString());
                result.success(re);
            }
        }, timeStamp, count, conversationTypes2);
    }

    private static ConversationType[] convertConversationTypes(List<Integer> conversationTypes) {
        List<ConversationType> list = new ArrayList<>();
        if (conversationTypes != null && conversationTypes.size() != 0) {
            for (int conversationType : conversationTypes) {
                list.add(ConversationType.setValue(conversationType));
            }
            return list.toArray(new ConversationType[0]);
        } else {
            return null;
        }
    }

    private void removeConversation(MethodCall methodCall, final Result result) {
        int conversationType = methodCall.argument("conversationType");
        String targetId = methodCall.argument("targetId");
        RongIMClient.getInstance().removeConversation(ConversationType.setValue(conversationType), targetId, new ResultCallback<Boolean>() {
            @Override
            public void onSuccess(Boolean aBoolean) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("Result", aBoolean);
                result.success(re);
            }

            @Override
            public void onError(ErrorCode errorCode) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                Log.i(TAG, "error:" + errorCode.toString());
                result.success(re);
            }
        });
    }

    private void getConversationNotificationStatus(MethodCall methodCall, final Result result) {
        String targetId = methodCall.argument("targetId");
        int conversationType = methodCall.argument("conversationType");
        RongIMClient.getInstance().getConversationNotificationStatus(ConversationType.setValue(conversationType), targetId, new ResultCallback<Conversation.ConversationNotificationStatus>() {
            @Override
            public void onSuccess(Conversation.ConversationNotificationStatus conversationNotificationStatus) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("Result", conversationNotificationStatus.getValue());
                result.success(re);
            }

            @Override
            public void onError(ErrorCode errorCode) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                Log.i(TAG, "error:" + errorCode.toString());
                result.success(re);
            }
        });
    }

    private void setConversationNotificationStatus(MethodCall methodCall, final Result result) {
        String targetId = methodCall.argument("targetId");
        int conversationType = methodCall.argument("conversationType");
        int notificationStatus = methodCall.argument("notificationStatus");
        RongIMClient.getInstance().setConversationNotificationStatus(ConversationType.setValue(conversationType), targetId, Conversation.ConversationNotificationStatus.setValue(notificationStatus), new ResultCallback<Conversation.ConversationNotificationStatus>() {
            @Override
            public void onSuccess(Conversation.ConversationNotificationStatus conversationNotificationStatus) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("Result", conversationNotificationStatus.getValue());
                result.success(re);
            }

            @Override
            public void onError(ErrorCode errorCode) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                Log.i(TAG, "error:" + errorCode.toString());
                result.success(re);
            }
        });
    }

    private void setNotificationQuietHours(MethodCall methodCall, final Result result) {
        String startTime = methodCall.argument("startTime");
        int spanMinutes = methodCall.argument("spanMinutes");
        RongIMClient.getInstance().setNotificationQuietHours(startTime, spanMinutes, new OperationCallback() {
            @Override
            public void onSuccess() {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("Result", true);
                result.success(re);
            }

            @Override
            public void onError(ErrorCode errorCode) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                Log.i(TAG, "error:" + errorCode.toString());
                result.success(re);
            }
        });
    }

    private void removeNotificationQuietHours(MethodCall methodCall, final Result result) {
        RongIMClient.getInstance().removeNotificationQuietHours(new OperationCallback() {
            @Override
            public void onSuccess() {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("Result", true);
                result.success(re);
            }

            @Override
            public void onError(ErrorCode errorCode) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                Log.i(TAG, "error:" + errorCode.toString());
                result.success(re);
            }
        });
    }

    private void clearMessages(MethodCall methodCall, final Result result) {
        String targetId = methodCall.argument("targetId");
        int conversationType = methodCall.argument("conversationType");
        RongIMClient.getInstance().clearMessages(ConversationType.setValue(conversationType), targetId, new ResultCallback<Boolean>() {
            @Override
            public void onSuccess(Boolean aBoolean) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("Result", aBoolean);
                result.success(re);
            }

            @Override
            public void onError(ErrorCode errorCode) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                result.success(re);
            }
        });
    }

    private void deleteMessages(MethodCall methodCall, final Result result) {
        String targetId = methodCall.argument("targetId");
        int conversationType = methodCall.argument("conversationType");
        int[] messageIds = methodCall.argument("messageIds");
        if (messageIds != null && messageIds.length != 0) {
            RongIMClient.getInstance().deleteMessages(messageIds, new ResultCallback<Boolean>() {
                @Override
                public void onSuccess(Boolean aBoolean) {
                    Map<String, Object> re = new HashMap<>();
                    re.put("Code", 0);
                    re.put("Result", aBoolean);
                    result.success(re);
                }

                @Override
                public void onError(ErrorCode errorCode) {
                    Map<String, Object> re = new HashMap<>();
                    re.put("Code", -1);
                    re.put("ErrorCode", errorCode.getValue());
                    re.put("ErrorInfo", errorCode.getMessage());
                    result.success(re);
                }
            });
        } else {
            RongIMClient.getInstance().deleteMessages(ConversationType.setValue(conversationType), targetId, new ResultCallback<Boolean>() {
                @Override
                public void onSuccess(Boolean aBoolean) {
                    Map<String, Object> re = new HashMap<>();
                    re.put("Code", 0);
                    re.put("Result", aBoolean);
                    result.success(re);
                }

                @Override
                public void onError(ErrorCode errorCode) {
                    Map<String, Object> re = new HashMap<>();
                    re.put("Code", -1);
                    re.put("ErrorCode", errorCode.getValue());
                    re.put("ErrorInfo", errorCode.getMessage());
                    result.success(re);
                }
            });
        }
    }

    private void getHistoryMessages(MethodCall methodCall, final Result result) {
        String targetId = methodCall.argument("targetId");
        int conversationType = methodCall.argument("conversationType");
        int oldestMessageId = methodCall.argument("oldestMessageId");
        int count = methodCall.argument("count");
        RongIMClient.getInstance().getHistoryMessages(ConversationType.setValue(conversationType), targetId, oldestMessageId, count, new ResultCallback<List<Message>>() {
            @Override
            public void onSuccess(List<Message> messages) {
                List<Map<String, Object>> list;
                if (messages != null & messages.size() != 0) {
                    list = new ArrayList<>();
                    for (Message message : messages) {
                        Map<String, Object> map = messageToMap(message);
                        list.add(map);
                    }
                } else {
                    list = null;
                }
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("Result", list);
                result.success(re);
            }

            @Override
            public void onError(ErrorCode errorCode) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                result.success(re);
            }
        });
    }

    private void saveTextMessageDraft(MethodCall methodCall, final Result result) {
        String targetId = methodCall.argument("targetId");
        int conversationType = methodCall.argument("conversationType");
        String content = methodCall.argument("content");
        RongIMClient.getInstance().saveTextMessageDraft(ConversationType.setValue(conversationType), targetId, content, new ResultCallback<Boolean>() {
            @Override
            public void onSuccess(Boolean aBoolean) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("Result", aBoolean);
                result.success(re);
            }

            @Override
            public void onError(ErrorCode errorCode) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                result.success(re);
            }
        });
    }

    private void getTextMessageDraft(MethodCall methodCall, final Result result) {
        String targetId = methodCall.argument("targetId");
        int conversationType = methodCall.argument("conversationType");
        RongIMClient.getInstance().getTextMessageDraft(ConversationType.setValue(conversationType), targetId, new ResultCallback<String>() {
            @Override
            public void onSuccess(String s) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("Result", s);
                result.success(re);
            }

            @Override
            public void onError(ErrorCode errorCode) {
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                result.success(re);
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
            case "sendLocationMessage":
                sendLocationMessage(arguments, eventSink);
                break;
            case "sendImageMessage":
                sendImageMessage(arguments, eventSink);
                break;
            case "sendMediaMessage":
                sendMediaMessage(arguments, eventSink);
                break;
            case "setOnReceiveMessageListener":
                setOnReceiveMessageListener(arguments, eventSink);
            case "setConnectionStatusListener":
                setConnectionStatusListener(arguments, eventSink);
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
            case "RC:LBSMsg":
                content = lbsMessageToMap((LocationMessage) message.getContent());
                break;
            case "RC:ImgMsg":
                content = imageMessageToMap((ImageMessage) message.getContent());
                break;
            case "RC:VcMsg":
                content = voiceMessageToMap((VoiceMessage) message.getContent());
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

    private Map<String, Object> lbsMessageToMap(LocationMessage message) {
        Map<String, Object> map = new HashMap<>();
        map.put("lat", message.getLat());
        map.put("lng", message.getLng());
        map.put("poi", message.getPoi());
        map.put("imgUri", message.getImgUri());
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

    private Map<String, Object> voiceMessageToMap(VoiceMessage message) {
        Map<String, Object> map = new HashMap<>();
        map.put("duration", message.getDuration());
        if (message.getUri() != null) {
            map.put("uri", message.getUri().toString());
        }
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
        Message myMessage = Message.obtain(targetId, ConversationType.setValue(conversationType), myTextMessage);
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
                re.put("Result", messageToMap(message));
                eventSink.success(re);
            }

            @Override
            public void onError(Message message, ErrorCode errorCode) {
                Log.i(TAG, "onError");
                Map<String, Object> re = new HashMap<>();
                re.put("Code", -1);
                re.put("ErrorCode", errorCode.getValue());
                re.put("ErrorInfo", errorCode.getMessage());
                eventSink.success(re);
            }
        });
    }


    private void sendLocationMessage(Object arguments, final EventSink eventSink) {
        String targetId = (String) argument(arguments, "targetId");
        String pushContent = (String) argument(arguments, "pushContent");
        String pushData = (String) argument(arguments, "pushData");
        int conversationType = (int) argument(arguments, "conversationType");

        Map<String, Object> content = (Map<String, Object>) argument(arguments, "content");
        double lat = (double) content.get("lat");
        double lng = (double) content.get("lng");
        String poi = (String) content.get("poi");
        Uri imgUri = Uri.parse((String) content.get("imgUri"));
        LocationMessage locationMessage = LocationMessage.obtain(lat, lng, poi, imgUri);
        Message myMessage2 = Message.obtain(targetId, ConversationType.setValue(conversationType), locationMessage);
        RongIMClient.getInstance().sendLocationMessage(myMessage2, pushContent, pushData, new IRongCallback.ISendMessageCallback() {
            @Override
            public void onAttached(Message message) {
                // 消息成功存到本地数据库的回调
                Log.i(TAG, "onAttached");
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 1);
                re.put("ErrorInfo", "onAttached");
                eventSink.success(re);
            }

            @Override
            public void onSuccess(Message message) {
                // 消息发送成功的回调
                ImageMessage im = (ImageMessage) message.getContent();
                Log.i(TAG, "onSuccess:" + im.getMediaUrl());
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("ErrorInfo", "onSuccess");
                re.put("Result", messageToMap(message));
                eventSink.success(re);
            }

            @Override
            public void onError(Message message, ErrorCode errorCode) {
                // 消息发送失败的回调
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
        Message myMessage3 = Message.obtain(targetId, ConversationType.setValue(conversationType), imageMessage);
        RongIMClient.getInstance().sendImageMessage(myMessage3, pushContent, pushData, new SendImageMessageCallback() {

            @Override
            public void onAttached(Message message) {
                Log.i(TAG, "onAttached");
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 1);
                re.put("ErrorInfo", "onAttached");
                eventSink.success(re);
            }

            @Override
            public void onError(Message message, ErrorCode errorCode) {
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
                re.put("Result", messageToMap(message));
                eventSink.success(re);
            }

            @Override
            public void onProgress(Message message, int i) {
                Log.i(TAG, "onProgress");
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 2);
                re.put("Result", i);
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
        Message message4 = Message.obtain(targetId, ConversationType.setValue(conversationType), fileMessage);
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
            public void onError(Message message, ErrorCode errorCode) {
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
                re.put("Result", messageToMap(message));
                eventSink.success(re);
            }

            @Override
            public void onProgress(Message message, int i) {
                Log.i(TAG, "onProgress:" + i);
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 2);
                re.put("Result", i);
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

    private void setOnReceiveMessageListener(Object arguments, final EventSink eventSink) {
        RongIMClient.setOnReceiveMessageListener(new RongIMClient.OnReceiveMessageListener() {
            @Override
            public boolean onReceived(Message message, int i) {
                Log.i(TAG, "onReceived");
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("ErrorInfo", "onReceived");
                re.put("Result", messageToMap(message));
                eventSink.success(re);
                return false;
            }
        });
    }

    private void setConnectionStatusListener(Object arguments, final EventSink eventSink) {
        RongIMClient.setConnectionStatusListener(new RongIMClient.ConnectionStatusListener() {
            @Override
            public void onChanged(ConnectionStatus connectionStatus) {
                Log.i(TAG, "onChanged");
                Map<String, Object> re = new HashMap<>();
                re.put("Code", 0);
                re.put("ErrorInfo", "onReceived");
                re.put("Result", connectionStatus.getValue());
                eventSink.success(re);
            }
        });
    }
}
