public with sharing class AccountController {
  //1st Gib By Gopi
    public static List<Account> getAllActiveAccounts() {
      return [SELECT Id,Name,Active__c FROM Account WHERE Active__c = 'Yes'];
    }
  }
