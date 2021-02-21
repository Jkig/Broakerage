library my_prj.globals;
import 'package:brokerage_app/services/stock_data.dart';


//Map quant1 = {'cash' :  9904.23, 'AAPL' : 0.0, 'TSLA' : 0.0, 'GOOGL' : 3.0, 'SPY': 0.0, 'TWTR': 0.0, 'DBX': 0.0, 'FB': 0.0, 'AMZN': 0.0, 'PLTR': 15.0, 'bitcoin' : 1.35 ,'ethereum' : 9.0, 'polkadot' : 668.1};
Map quant1 = {'cash' :  8438.78, 'AAPL' : 0.0, 'NVDA' : 1.0, 'GOOGL' : 3.0, 'SNOW': 1.0, 'AMD': 2.0, 'AI': 1.0, 'FB': 1.0, 'AMZN': 0.0, 'PLTR': 15.0, 'bitcoin' : 1.35 ,'ethereum' : 9.0, 'polkadot' : 668.1};
int account = 0;
int timeFrame = 0;

//so profile works, defined after shit sent to home is defined
double cash = 0.0;
double total = 0;
List<StockData> stocks = [];