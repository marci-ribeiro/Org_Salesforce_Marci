@isTest
public with sharing class TestVerifyDate {

    @isTest
    public static void TestVerifyDateCheckDatesValid1() {
        Date valid1 = VerifyDate.CheckDates(date.valueOf('21-05-14'), date.valueOf('21-05-24'));
        System.assertEquals(date.valueOf('21-05-24'), valid1);
   }

   @isTest
   public static void TestVerifyDateCheckDatesValid2() {
       Date valid2 = VerifyDate.CheckDates(date.valueOf('21-05-14'), date.valueOf('21-06-24'));
       System.assertEquals(date.valueOf('21-05-31'), valid2);
  }
}
