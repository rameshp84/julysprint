trigger AccountDelete on Account (before delete) {
 for(Account Acc:trigger.old)

 {

 acc.adderror('You Cannot Delete the Account Record');

 }

 }