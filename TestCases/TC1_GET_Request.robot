*** Settings ***
Library   RequestsLibrary
Library   Collections

*** Variables ***
${base_url}   https://demoqa.com
${city}    New York

*** Test Cases ***
Get_weatherInfo
    create session  myssion  ${base_url}
    ${response}=  get request  myssion   /utilities/weather/city/${city}
#    log to console   ${response.status_code}
#    log to console   ${response.content}
#    log to console   ${response.headers}

# Validations
    ${status_code}=   convert to string  ${response.status_code}
    should be equal  ${status_code}     200

    ${body_content}=  convert to string  ${response.content}
    should contain  ${body_content}  New York

    ${headers}=  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${headers}   application/json; charset=utf-8