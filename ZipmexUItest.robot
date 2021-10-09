*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open browser  ${TC_url}  chrome
Test Setup  Click Element  //*[contains(text(), "USDT/USD")]
Suite Teardown  close browser
*** Variables ***
${TC_url}  https://trade.zipmex.com/global/trade
***Keywords***
Start browser
Select USDT/USD
Click best price to buy/sell
adjust price
input amount
log slip
*** Test Cases ***
Buy_TC
    Sleep  3
    click Element  //body/div[@id='root']/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[8]/div[3]/div[1]
    ${BUY}=  get value  //*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/form[1]/div[1]/div[1]/div/div/div[2]/input
    ${BUY_NEW}=  Evaluate  ${BUY}+(${BUY}*0.01)
    Clear Element Text  //*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/form[1]/div[1]/div[1]/div/div/div[2]/input
    Input text  //*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/form[1]/div[1]/div[1]/div/div/div[2]/input  ${BUY_NEW}
    Input text  //*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/form[1]/div[1]/div[2]/div/div/div[2]/input  1.00
    ${BUY_TOTAL}=  get value  //*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/form[1]/div[1]/div[4]/div/div/div[2]/input
    Log to console  \nTrade USDTUSD\nwith side = BUY\nwith price = ${BUY_NEW}\nbuy price is 1.00\nbut total is ${BUY_TOTAL} 
Sell_TC
    Sleep  3
    click Element  //*[@id="root"]/div[1]/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div/div/div[2]/div[3]/div[1]/div[3]/div[1]
    ${SELL}=  get value  //*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/form[2]/div[1]/div[1]/div/div/div[2]/input 
    ${SELL_NEW}=  Evaluate  ${SELL}-(${SELL}*0.01)
    Clear Element Text  //*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/form[2]/div[1]/div[1]/div/div/div[2]/input 
    Input Text  //*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/form[2]/div[1]/div[2]/div/div/div[2]/input  ${SELL_NEW}
    Input Text  //*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/form[2]/div[1]/div[2]/div/div/div[2]/input  1.00
    ${SELL_TOTAL}=  get value  //*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/form[2]/div[1]/div[4]/div/div/div[2]/input
    Log to console  \nTrade USDTUSD\nwith side = SELL\nwith price = ${Sell_NEW} \nbuy price is 1.00\nbut total is ${SELL_TOTAL}
    
    ##robot -d results tests/zipmex/ZipmexUItest.robot