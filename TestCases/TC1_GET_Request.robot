*** Settings ***
Library   RequestsLibrary

*** Variables ***
${base_url}   https://demoqa.com
${city}    New York

*** Test Cases ***
Get_weatherInfo
    create session  myssion  ${base_url}
    ${response}=  get request  myssion   /utilities/weather/city/${city}
    log to console   ${response.status_code}
    log to console   ${response.content}
    log to console   ${response.headers}


