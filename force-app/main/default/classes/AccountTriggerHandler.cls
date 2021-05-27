 public class AccountTriggerHandler {
//     // ## Atributos:
//     public Map<Id,Account> newRecordMap;
//     public Map<Id,Account> oldRecordMap;
//     public List<Account>  newRecordList;
//     public List<Account> oldRecordList;

//     // ##Construtor:
//     public AccountTriggerHandler() {
//         this.newRecordMap = new Map<Id,Account>();
//         this.oldRecordMap = new Map<Id,Account>();
//         this.newRecordList = new List<Account>();
//         this.oldRecordList = new List<Account>();
//     }

//     public void onBeforeInsert() {      
//         validateDocument();
//     }

//     public void onBeforeUpdate() {
//         validateDocument();
//     }

//     public void onAfterInsert() {
//     }

//     public void onAfterUpdate() {
//     }

//     //método para ser usado no before:
//     private void validateDocument() {
//         for (Account acc : newRecordList) {
//             if(!IsValidateDocument(acc.CPF__c)) { 
//                 acc.CPF__c.addError(Label.ACCOUNT_CPF_ERROR_MESSAGE);
//             }
//         }
//     }

//     //metódo para ser usado no metódo de cima:
//     private Boolean IsValidateDocument(String cpf) {
//         String cpfNumbers = getOnlyNumbers(cpf);
//         if (cpfNumbers.length() == 11) {
//             return true;
//         } else {
//             return false;
//         }
//     }

//     //metódo para ser usado no metódo de cima:
//     private String getOnlyNumbers(String cpf) {
//         String cpfNumbers = '';
//         for(Integer i = 0; i < cpf.length(); i++) {
//             String ch = cpf.mid(i, 1);
//             if(ch.isNumeric()) {
//                 cpfNumbers = cpfNumbers + ch;
//             }
//         }
//         return cpfNumbers;
//     }
 }