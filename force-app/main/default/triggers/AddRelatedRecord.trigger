trigger AddRelatedRecord on Account (before insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    
    //Obtenha as oportunidades relacionadas para as contas neste gatilho
    Map<Id,Account> acctsWithOpps = new Map<Id,Account> (
        [SELECT Id, (SELECT Id FROM Opportunities) 
        FROM Account 
        WHERE Id IN :Trigger.New]);
    
    //Adicione uma oportunidade para cada conta se ainda não tiver uma.
    //Itere em cada conta.
    for(Account a :Trigger.New) {
        
        System.debug('acctsWithOpps.get(a.Id).Opportunities.size()=' + acctsWithOpps.get(a.Id).Opportunities.size());
        
        //Verifique se a conta já tem uma oportunidade relacionada.
        if (acctsWithOpps.get(a.Id).Opportunities.size() == 0) {
            
            //Caso contrário, adicione uma oportunidade padrão
            oppList.add(new Opportunity(Name = a.Name + 'Opportunity',
                                        StageName = 'Prospecting',
                                        CloseDate = System.today().addMonths(1),
                                        AccountId = a.Id));
        }
    }
    if (oppList.size() > 0) {
        insert oppList;
    }    
}