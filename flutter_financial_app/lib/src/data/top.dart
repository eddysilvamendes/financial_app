import 'package:flutter_financial_app/src/models/money_model.dart';

List<Money> geter_top() {
  Money upwork = Money();
  upwork.name = 'upwork';
  upwork.fee = '-650';
  upwork.time = 'today';
  upwork.image = 'money.png';
  upwork.buy = false;
  Money creditcart = Money();
  creditcart.name = 'Credit';
  creditcart.fee = '-60';
  creditcart.time = 'yeterday';
  creditcart.image = 'credit-card.png';
  creditcart.buy = true;

  return [upwork, creditcart];
}
