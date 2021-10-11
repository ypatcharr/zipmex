# zipmex
Hello there,
from test challenge I complete on section 1 : Test Strategy and Section 2 : Web UI test 

Section 1 : Test Strategy

    - In this part I see a big flow as 
    
    Calculate Index >> Select Vehicle >> Calculate last price
    
    So my testing is aim to focus of gap in each step which can be lead to miscalculation and normal case.
    
    - My gap case is about the corner value (value with decimal) will system roundup or rounddown correctly ? So I take all the scenario can happen in this gap.
    - So test step of the test case will be like a matrix of possibility, Enter value on TC and see the result has be as expected result 
  
    

Section 2 : Web UI test

    - In this part my step is as follow
    1. Enter website
    2. Select USDTUSD paring
    3. Select best price to buy/sell
    4. After select price, those price will auto fill in price in new order and I Store the value
    5. Clear the price that fill the order and fill a new price which come from our adjustment
    6. Enter amount
    7. System will calculate total
    8. Print to console to see the sumary of this bill
