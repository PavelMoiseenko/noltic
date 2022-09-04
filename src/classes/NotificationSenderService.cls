public with sharing class NotificationSenderService {
    private NotificationSender sender;
    private String message;

    public void initNotificationSender(NotificationSender sender, String message) {
        this.sender = sender;
        this.message = message;
    }

    public void executeSend() {
        this.sender.sendNotification(this.message);
    }
}



//Code to check sending an email and creating a record of Notification__c type
//
//List<NotificationSender> senders = new List<NotificationSender>{
//        new EmailNotificationSender(), new ObjectNotificationSender()
//};
//
//NotificationSenderService service = new NotificationSenderService();
//
//for (NotificationSender sender : senders) {
//    service.initNotificationSender(sender, 'Hello my friend'); service.executeSend();
//}