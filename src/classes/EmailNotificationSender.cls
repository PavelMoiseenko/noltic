public with sharing class EmailNotificationSender implements NotificationSender {

    public void sendNotification(String notificationMessage) {
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        String currentUserEmail = UserInfo.getUserEmail();
        message.toAddresses = new List<String>{ currentUserEmail };
        message.subject = 'Mail from friend';
        message.plainTextBody = notificationMessage;
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        if (results[0].success) {
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: ' + results[0].errors[0].message);
        }
    }
}