public inherited sharing class ImobiliariaController { 

    //Definições das variáveis:
    public String quartos {get; set;}
    public String banheiros {get; set;}
    public String sala {get; set;}
    public String cozinha {get; set;}
    public String copa {get; set;}
    public String suite {get; set;}
    public String vagas {get; set;}
    public String valor {get; set;}
    public String tipoImovel {get; set;}

    //Método picklist    
    public List<SelectOption> getMinhasOpcoes() {
        
        //Mapear o campo de lista de seleção/picklist que desejo listar    
        Schema.DescribeFieldResult describeResult = Imoveis__c.TipoImovel__c.getDescribe();
        
        //listar as opções válidas dentro do meu campo
        List<Schema.PicklistEntry> entries = describeResult.getPickListValues();
        
        //Cria variável de retorno do tipo de lista para o objeto SelectOption       
        List<SelectOption> optionsToReturn = new List<SelectOption>();
        
        //Adiciona as opções do campo listadas
        for(Schema.PicklistEntry pEntry : entries){
        
            //se a opção esta ativa
            //Ou pode aplicar o filtro que quiser, caso não queira mostrar todas as opções
            if(pEntry.isActive()){
                //Adiciona o nome e o valor na variável retorno
                optionsToReturn.add(new SelectOption(pEntry.getValue(), pEntry.getLabel()));
            }
            
            }
            //Retorna a lista de selectOption criamos na variável de retorno
            return optionsToReturn;        
        }    

    //Método salvar
    public void salvarImoveis() {
       
        Imoveis__c objImoveis = new Imoveis__c(); 
        
        objImoveis.Quartos__c = quartos;
        objImoveis.Sala__c = sala;
        objImoveis.Cozinha__c = cozinha;
        objImoveis.Copa__c = copa;
        objImoveis.Suite__c = suite;
        objImoveis.Garagem__c = vagas;
        objImoveis.Valor__c = valor;
        objImoveis.TipoImovel__c = tipoImovel;

        insert objImoveis;	
        
        // try{
        //     if(objImoveis.TipoImovel__c != 'Nenhum' && objImoveis.TipoImovel__c != null) {
        //         ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.CONFIRM, 'Imóvel cadastrado com sucesso!' ));
        //         insert objImoveis;	
        //     }else {
        //         ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.CONFIRM, 'O campo tipo do imóvel deverá ser preenchido.' ));
        //     }
        // }catch(DmlExcepition e) {
        //     ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.CONFIRM, 'Por favor verifique todos os campos antes de salvar.' ));
        // }  
    }
}