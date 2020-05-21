public with sharing class AcctUpsertList {
    public AcctUpsertList() {
//2nd git by Gopi
    }
    public static void upsertListAccout(){
        List<String> accdetails=new List<String>{'Bombay'};
        List<Account> accdetailsBom=new List<Account>();
        List<Account> updaccdetailsBom=new List<Account>();
        if(accdetails.size()>0 && !(accdetails.isEmpty()))
        {
            system.debug('accdetails fetched from Bombay-->'+accdetails);
            accdetailsBom=[select id,billingcity from account where billingcity in:accdetails];
            system.debug('Data from select-->'+accdetailsBom);
           
        }
        if(accdetailsBom.size()>0 && !(accdetailsBom.isEmpty()))
        {
            system.debug('accdetailsBom-->'+accdetailsBom);
            for(Account updet:accdetailsBom)
            {
                updet.Billingcity='Mumbai';
                 updaccdetailsBom.add(updet);
            }
            system.debug('After loop-->'+updaccdetailsBom);
        }
        try{
            Account newacc=new Account(Name='New account for upsert',BillingCity='Rajam');
            updaccdetailsBom.add(newacc);
            system.debug('values that need to be updated-->'+newacc);
            if(updaccdetailsBom.size()>0 && !(updaccdetailsBom.isEmpty()))
            {
                upsert(updaccdetailsBom);
                system.debug('after upsert-->'+updaccdetailsBom);
            }
        }catch(DMLException e)
        {
            system.debug(e.getMessage());
        }

    }
}
