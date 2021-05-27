import { LightningElement, track } from 'lwc';

export default class ConditionalRendering extends LightningElement {

  @track displayDiv = false;
  @track cityList = ['São Paulo', 'Minas Gerais', 'Santa Catarina'];

  ShowDivHandler(event){
    this.DisplayDiv = event.target.checked;
  }
}