//Calling the code from Apex class - Trigger with Handler

trigger CreatingAccount on Account (after insert) {
        AccountHandler.Createcontact(trigger.new);

}