<aura:application extends="force:slds">
  <!-- Create attribute to store lookup value as a sObject--> 
  <aura:attribute name="selectedLookUpRecordAcc" type="sObject" default="{}"/>
  <aura:attribute name="selectedLookUpRecordOpp" type="sObject" default="{}"/>
 
  <c:testPick objectAPIName="account" IconName="standard:account" selectedRecord="{!v.selectedLookUpRecordAcc}" label="Account Name" idObject=""/>

  <c:testPick objectAPIName="opportunity" IconName="standard:account" selectedRecord="{!v.selectedLookUpRecordOpp}" label="Account Name" idObject="{!v.selectedLookUpRecordAcc.Id}"/>

</aura:application>