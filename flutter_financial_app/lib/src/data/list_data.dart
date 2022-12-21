import 'package:flutter_financial_app/src/models/money_model.dart';

List<Money> geter(){
  Money upwork = Money();
  upwork.name = 'upwork';
  upwork.fee = '650';
  upwork.time = 'today';
  upwork.image = 'money.png';
  upwork.buy= false;
  Money creditcart = Money();
  creditcart.name = 'Credit';
  creditcart.fee = '60';
  creditcart.time = 'yeterday';
  creditcart.image = 'credit-card.png';
  creditcart.buy= true;
  Money cash = Money();
  cash.name = 'Tansfer for sam';
  cash.fee = '6000';
  cash.time = 'jan 30,2022';
  cash.image = 'cash-back.png';
  cash.buy= false;
  return[upwork,creditcart,cash];
}