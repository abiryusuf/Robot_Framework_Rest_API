*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  String

*** Variables ***
${base_url}   https://simple-books-api.glitch.me
${headers}   Au "bbbbd73823f3c9a0c7b42885146baecc4d630baf6c8794c1a5d82acfe38a2b4e"

*** Test Cases ***
TC3:Returns all books
    create session  mysession  ${base_url}
    ${response}=  get request  mysession   /orders  ${headers}


    log to console  ${response.status_code}
    log to console  ${response.content}
# Validation
    ${status_code}=   convert to string  ${response.status_code}
    should be equal  ${status_code}   200

