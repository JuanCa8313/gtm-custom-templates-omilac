___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "CSS Element with Content Results",
  "description": "Returns 2 arrays",
  "containerContexts": [
    "WEB"
  ],
  "categories": ["ANALYTICS", "UTILITY"]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "pagePath",
    "displayName": "Page Regex of conditions",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "functionRegexValidator",
    "displayName": "Function Regex Validator",
    "simpleValueType": true
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "array",
    "displayName": "Information",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "CSS Selectors",
        "name": "cssSelectors",
        "type": "TEXT",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "defaultValue": "",
        "displayName": "Content Results",
        "name": "contentResults",
        "type": "TEXT",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

/**
  Autor: Juan Camilo Arcila Velasquez.
  Company: Omilac
  Year: 2022
  LinkedIn: https://www.linkedin.com/in/juan-camilo-arcila-vel%C3%A1squez-0515a2241/
**/


// Introduzca aquí su código de plantilla.
const log = require('logToConsole');
const getUrl = require('getUrl');
//log('data =', data);
//log('data array =', data.array);
//log('data url =', data.pagePath);
//log('data function regex =', typeof data.functionRegexValidator);

const functionRegex = data.functionRegexValidator;
const url = data.pagePath;
const arr = data.array;
const path = getUrl('path');
var result;

//log('data url =', path);

function getArrays(item) {
  return [item.cssSelectors,item.contentResults];
}

const arrayColumn = (arr, n) => arr.map(x => x[n]);

if(functionRegex(url,path)){
  
  //log('data regex valitor  =', "works");

  const arr_axi = arr.map(getArrays);

  const arr_css_selectors = arrayColumn(arr_axi, 0);

  const arr_content_results = arrayColumn(arr_axi, 1);

  //log('data axi =',  arr_axi);
  //log('data axi 0 =', arr_css_selectors);
  //log('data axi 1 =', arr_content_results);

  // Las variables deben devolver un valor.
  
  result = [arr_css_selectors,arr_content_results];

}

return result;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Untitled test 1
  code: "const mockData = {\n  // Mocked field values\n  functionRegexValidator: (entry,comp)\
    \ => {\n  \treturn entry.match(comp);\n  },\n  pagePath: '.*',\n  array:[\n  \
    \  {\n      cssSelectors:\"section#modulo-productos a, section#modulo-productos\
    \ a *\",\n       contentResults:\"valor 1\"\n    },\n    {\n      cssSelectors:\"\
    #calle-salida-fija-imagen > div.cards-container > div > div > a, #calle-salida-fija-imagen\
    \ > div.cards-container > div > div > a *\",\n       contentResults:\"valor 2\"\
    \n    }\n  ]\n};\n\n// Call runCode to run the template's code.\nlet variableResult\
    \ = runCode(mockData);\n\n// Verify that the variable returns a result.\nassertThat(variableResult).isNotEqualTo(undefined);"


___NOTES___

Created on 6/12/2022, 10:28:11


