*** Settings ***

Library           Autosphere.Browser
Library           Autosphere.Excel.Files
Library           Autosphere.HTTP
Library           Autosphere.PDF
Library           OperatingSystem
#Library           UploadImage.py
Library           pabot.PabotLib
Library           Autosphere.Desktop
Test Teardown     Close All Browsers
*** Keywords ***
Open The Background Remover Website
    Open Available Browser   https://www.fotor.com/features/background-remover

*** Keywords ***
Upload Image
     Click Element When Visible    xpath://*[@id="root"]/div[1]/div[2]/div[1]/div/div[2]/div[2]/div/div
     Sleep  3
     Autosphere.Desktop.Click  image:./images/filename.png
     
     Autosphere.Desktop.Type Text   C:\\Users\\LENOVO T470\\Documents\\images.jpg
     Sleep  1
     Autosphere.Desktop.Press keys   enter
     
#    Upload File By Selector  xpath://*[@id="root"]/div[1]/div[2]/div[1]/div/div[2]/div[2]/div/div  C:\\Users\\LENOVO T470\\Documents\\image.jpg
#    UploadImage.Get Session

*** Tasks ***
Remove Background after Uploading the Image
    [Setup]  Open The Background Remover Website
    pabot.PabotLib.Acquire Lock  MYLOCK
    Upload Image
    pabot.PabotLib.Release Lock  MYLOCK
    Sleep  7s
    [Teardown]  Close All Browsers